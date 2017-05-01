#pragma once

#include <stdlib.h>

#include "Hash.h"

#define SHADER_NULL 0

typedef unsigned int SHADER;

void Shader_InitializeManager(size_t count);

void Shader_Register(HASH hash, SHADER shader);

SHADER Shader_Get(HASH hash);
