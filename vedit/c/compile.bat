cmd /c emcc source/Template.c -o obj/Template.bc -I include
cmd /c emcc source/Texture.c -o obj/Texture.bc -I include
cmd /c emcc source/Shader.c -o obj/Shader.bc -I include
cmd /c emcc source/Volume.c -o obj/Volume.bc -I include

cmd /c emcc obj/Template.bc obj/Texture.bc obj/Shader.bc obj/Volume.bc -Os -s WASM=1 -s SIDE_MODULE=1 -o ../template.wasm
