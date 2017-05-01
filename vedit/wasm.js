var GL = document.getElementById("canvasWebGL").getContext("webgl");

var wasm = (function() {
	var wasmModule = {};

	wasmModule.libc = (function() {
		var modules = {};

		modules.stdlib = (function() {
			var stdlib = {};

			var PAGE_SIZE = 1024 * 64;
			var NUM_PAGES = 256;
			var HEAP_PTR = 0;

			var BUFFER;

			var alignHeapPtr = function() {
				HEAP_PTR = (HEAP_PTR % 4) == 0 ? HEAP_PTR : HEAP_PTR + (4 - (HEAP_PTR % 4));
			};

			stdlib.prepareHeap = function(buffer, offset) {
				HEAP_PTR = offset;
				alignHeapPtr();
				BUFFER = buffer;
			};

			stdlib.calloc = function(numItems, size) {
				var bytes = numItems * size;
				var ptr = stdlib.malloc(bytes);
				new Uint8Array(BUFFER).fill(0, ptr, ptr + bytes);
				return ptr;
			};

			stdlib.malloc = function(bytes) {
				if (bytes > PAGE_SIZE * NUM_PAGES - HEAP_PTR) {
					return null;
				}
				var ptr = HEAP_PTR;
				HEAP_PTR += bytes;
				alignHeapPtr();
				console.log("MALLOC: size(" + bytes + "), ptr(" + ptr + ")");
				return ptr;
			};

			stdlib.free = function(ptr) {
			};

			return stdlib;
		})();

		return modules;
	})();

	wasmModule.memory = null;
	wasmModule.instance = null;

	wasmModule.createInstance = function(url) {
		return new Promise(function(resolve, reject) {
			fetch(url).then(function(response) {
				response.arrayBuffer().then(function(buffer) {
					wasmModule.memory = new WebAssembly.Memory({ initial: 1024 });
					wasmModule.libc.stdlib.prepareHeap(wasmModule.memory.buffer, 1024 * 64);

					WebAssembly.compile(buffer).then(function(module) {
						var imports = {};

						imports.env = {};
						imports.env.memoryBase = 0;
						imports.env.memory = wasmModule.memory;
						imports.env.tableBase = 0;
						imports.env.table = new WebAssembly.Table({ initial: 0, element: 'anyfunc' });

						// TODO: Custom imports go here
						imports.env._calloc = wasmModule.libc.stdlib.calloc;
						imports.env._malloc = wasmModule.libc.stdlib.malloc;
						imports.env._free = wasmModule.libc.stdlib.free;

						WebAssembly.instantiate(module, imports).then(function(instance) {
							wasmModule.instance = instance;
							resolve(wasmModule.instance);
						}); // instantiate
					}); // compile
				}); // arrayBuffer
			}); // fetch
		}); // new Promise
	}; // createInstance

	return wasmModule;
})();

var template = (function() {
	var module = {};

	var shaderManifest;
	var shaderLoadIndex = 0;
	var shadersLoaded = 0;

	// JSON object listing all textures to be loaded
	var textureManifest;
	// The index of the next texture to load
	var textureLoadIndex = 0;
	// The number of textures that have been successfully loaded
	var texturesLoaded = 0;

	var meshManifest;
	var meshLoadIndex = 0;
	var meshesLoaded = 0;

	var textures = [];
	var shaders = [];

	var loadShader = function(resolve) {
		var shaderIndex = shaderLoadIndex++;

		if (shaderIndex >= shaderManifest.shaders.length) {
			return;
		}

		var manifestEntry = shaderManifest.shaders[shaderIndex];

		fetch(manifestEntry.vertex).then(function(vertResponse) {
			vertResponse.text().then(function(vertSource) {
				fetch(manifestEntry.fragment).then(function(fragResponse) {
					fragResponse.text().then(function(fragSource) {
						var vertShader = GL.createShader(GL.VERTEX_SHADER);
						GL.shaderSource(vertShader, vertSource);
						GL.compileShader(vertShader);

						var fragShader = GL.createShader(GL.FRAGMENT_SHADER);
						GL.shaderSource(fragShader, fragSource);
						GL.compileShader(fragShader);

						var shader = GL.createProgram();
						GL.attachShader(shader, vertShader);
						GL.attachShader(shader, fragShader);
						GL.linkProgram(shader);

						console.log("SHADER(" + manifestEntry.name + "): " + GL.getProgramParameter(shader, GL.LINK_STATUS));

						shaders.push(shader);

						var arrayIndex = shaders.findIndex(function(element, index, array) {
							if (element == shader) {
								return true;
							}
							return false;
						});

						wasm.instance.exports["_Shader_Register"](manifestEntry.hash, arrayIndex);

						console.log("Shader Loaded: " + manifestEntry.name);

						if (shaderIndex == shaderManifest.shaders.length - 1) {
							resolve();
						}

						// Recursively load shaders
						loadShader(resolve);
					});
				});
			});
		});
	};

	var loadTexture = function(resolve) {
		var textureIndex = textureLoadIndex++;

		if (textureIndex >= textureManifest.textures.length) {
			return;
		}

		var manifestEntry = textureManifest.textures[textureIndex];

		fetch(manifestEntry.path).then(function(response) {
			response.arrayBuffer().then(function(buffer) {
				var image = new Uint8Array(buffer);

				var texture = GL.createTexture();

				GL.bindTexture(GL.TEXTURE_2D, texture);
				GL.texImage2D(GL.TEXTURE_2D, 0, GL.RGBA, 128, 96, 0, GL.RGBA, GL.UNSIGNED_BYTE, image);
				GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.NEAREST);
				GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.NEAREST);
				GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_S, GL.CLAMP_TO_EDGE);
				GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_T, GL.CLAMP_TO_EDGE);
				GL.bindTexture(GL.TEXTURE_2D, null);

				textures.push(texture);

				var arrayIndex = textures.findIndex(function(element, index, array) {
					if (element == texture) {
						return true;
					}
					return false;
				});

				wasm.instance.exports["_Texture_Register"](manifestEntry.hash, arrayIndex);

				console.log("Texture Laoded: " + manifestEntry.name);

				if (textureIndex == textureManifest.textures.length - 1) {
					resolve();
				}

				// Recursively load textures.
				loadTexture(resolve);
			});
		});
	};

	var loadTextures = function() {
		var promise = new Promise(function(resolve, reject) {
			fetch("textures/manifest.json").then(function(response) {
				response.json().then(function(manifest) {
					textureManifest = manifest;

					// Initialize the texture manager
					wasm.instance.exports["_Texture_InitializeManager"](manifest.textures.length);

					// Throttle texture fetching to 8 simultaneous repeating requests
					for (var i = 0; i < 8; i++) {
						loadTexture(resolve);
					}
				});
			});
		});

		return promise;
	};

	var loadShaders = function() {
		var promise = new Promise(function(resolve, reject) {
			fetch("shaders/manifest.json").then(function(response) {
				response.json().then(function(manifest) {
					shaderManifest = manifest;

					// Initialize the texture manager
					wasm.instance.exports["_Shader_InitializeManager"](manifest.shaders.length);

					// Throttle texture fetching to 4 simultaneous repeating requests
					for (var i = 0; i < 4; i++) {
						loadShader(resolve);
					}
				});
			});
		});

		return promise;
	}

	module.loadAssets = function() {
		var promise = new Promise(function(resolve, reject) {
			loadTextures().then(function() {
				loadShaders().then(function() {
					console.log("");
					console.log("ALL ASSETS LOADED");
					console.log("");
					resolve();
				});
			});
		});

		return promise;
	};

	module.initialize = function() {
		wasm.instance.exports["_Template_Initialize"]();
	};

	module.run = function() {
		//wasm.instance.exports["_Template_Cycle"]();
		//requestAnimationFrame(module.run);
	};

	return module;
})();
