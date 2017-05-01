#include "Template.h"

#include "Volume.h"

struct Template
{
	Volume* volume;
};

static struct Template Template = { 0 };

void Template_Initialize()
{
	Template.volume = Volume_Create((IVector3) { 16, 16, 16 });
}

void Template_Cycle()
{
}
