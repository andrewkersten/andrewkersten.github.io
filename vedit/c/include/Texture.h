#pragma once

#include <stdlib.h>

#include "Hash.h"

#define TEXTURE_NULL 0

typedef unsigned int TEXTURE;

void Texture_InitializeManager(size_t count);

void Texture_Register(HASH hash, TEXTURE texture);

TEXTURE Texture_Get(HASH hash);
