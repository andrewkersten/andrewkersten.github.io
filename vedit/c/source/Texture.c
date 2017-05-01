#include "Texture.h"

#include <stdlib.h>

struct TextureEntry
{
	HASH hash;
	TEXTURE texture;
};

typedef struct TextureEntry TextureEntry;

struct TextureCollection
{
	TextureEntry* entries;
	size_t count;
	size_t capacity;
};

typedef struct TextureCollection TextureCollection;

static TextureCollection Textures = { 0 };

void Texture_InitializeManager(size_t count)
{
	Textures.count = 0;
	Textures.capacity = count;
	Textures.entries = malloc(count * sizeof(TextureEntry));
}

void Texture_Register(HASH hash, TEXTURE texture)
{
	if (Textures.count < Textures.capacity)
	{
		Textures.entries[Textures.count++] = (TextureEntry) { hash, texture };
	}	
}

TEXTURE Texture_Get(HASH hash)
{
	for (size_t i = 0; i < Textures.count; i++)
	{
		if (Textures.entries[i].hash == hash)
		{
			return Textures.entries[i].texture;
		}
	}

	return TEXTURE_NULL;
}