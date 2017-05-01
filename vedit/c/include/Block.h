#pragma once

#include "Bool.h"
#include "Color.h"
#include "IVector3.h"

struct Block
{
	IVector3 local_position;
	BOOLINT exists;
	Color color;
};

typedef struct Block Block;
