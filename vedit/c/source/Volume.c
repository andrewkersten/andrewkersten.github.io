#include "Volume.h"

#include "Bool.h"
#include "Color.h"

#include <stdlib.h>

struct BlockData
{
	Color color;
};

typedef struct BlockData BlockData;

struct Volume
{
	IVector3 dimensions;
	size_t capacity;
	BOOLCHAR* block_exists;
	BlockData* block_data;
};

static int LocalToIndex(Volume* volume, int x, int y, int z)
{
	IVector3 dimensions = volume->dimensions;

	return (dimensions.x * dimensions.z * y) + (dimensions.x * z) + x;
}

/*
void Volume_Init(Volume* volume, IVector3 dimensions)
{
	if (volume == NULL)
	{
		return;
	}

	volume->dimensions = dimensions;
	volume->capacity = dimensions.x * dimensions.y * dimensions.z;

	volume->block_exists = calloc(volume->capacity, sizeof(BOOLCHAR));
	volume->block_data = calloc(volume->capacity, sizeof(BlockData));
}
*/

Volume* Volume_Create(IVector3 dimensions)
{
	Volume* volume = calloc(1, sizeof(Volume));

	volume->dimensions = dimensions;
	volume->capacity = dimensions.x * dimensions.y * dimensions.z;

	volume->block_exists = calloc(volume->capacity, sizeof(BOOLCHAR));
	volume->block_data = calloc(volume->capacity, sizeof(BlockData));

	return volume;
}

IVector3 Volume_GetDimensions(Volume* volume)
{
	if (volume == NULL)
	{
		return (IVector3) { 0, 0, 0 };
	}

	return volume->dimensions;
}

/*
void Volume_SetDimensions(Volume* volume, IVector3 dimensions)
{
	if (volume == NULL)
	{
		return;
	}

	volume->dimensions = dimensions;
}
*/

Block Volume_GetBlock(Volume* volume, int x, int y, int z)
{
	if (volume == NULL)
	{
	}

	int block_index = LocalToIndex(volume, x, y, z);

	Block block;

	block.local_position = (IVector3) { x, y, z };
	block.exists = volume->block_exists[block_index];
	block.color = volume->block_data[block_index].color;

	return block;
}

void Volume_SetBlock(Volume* volume, Block block)
{
	if (volume == NULL)
	{
		return;
	}

	int block_index = LocalToIndex(volume, block.local_position.x, block.local_position.y, block.local_position.z);

	volume->block_exists[block_index] = block.exists;
	volume->block_data[block_index].color = block.color;
}
