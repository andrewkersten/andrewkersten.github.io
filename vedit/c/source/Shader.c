#include "Shader.h"

#include <stdlib.h>

struct ShaderEntry
{
	HASH hash;
	SHADER texture;
};

typedef struct ShaderEntry ShaderEntry;

struct ShaderCollection
{
	ShaderEntry* entries;
	size_t count;
	size_t capacity;
};

typedef struct ShaderCollection ShaderCollection;

static ShaderCollection Shaders = { 0 };

void Shader_InitializeManager(size_t count)
{
	Shaders.count = 0;
	Shaders.capacity = count;
	Shaders.entries = malloc(count * sizeof(ShaderEntry));
}

void Shader_Register(HASH hash, SHADER shader)
{
	if (Shaders.count < Shaders.capacity)
	{
		Shaders.entries[Shaders.count++] = (ShaderEntry) { hash, shader };
	}	
}

SHADER Shader_Get(HASH hash)
{
	for (size_t i = 0; i < Shaders.count; i++)
	{
		if (Shaders.entries[i].hash == hash)
		{
			return Shaders.entries[i].texture;
		}
	}

	return SHADER_NULL;
}
