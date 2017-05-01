#pragma once

#include "Block.h"
#include "IVector3.h"

struct Volume;

typedef struct Volume Volume;

Volume* Volume_Create(IVector3 dimensions);

//void Volume_Init(Volume* volume, IVector3 dimensions);

IVector3 Volume_GetDimensions(Volume* volume);

//void Volume_SetDimensions(Volume* volume, IVector3 dimensions);

Block Volume_GetBlock(Volume* volume, int x, int y, int z);

void Volume_SetBlock(Volume* volume, Block block);

//void Volume_Raytrace(Volume* volume, Ray* ray);

//void Volume_Mesh(Volume* volume);
