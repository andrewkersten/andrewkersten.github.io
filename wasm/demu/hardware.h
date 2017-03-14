#pragma once

#include <stdint.h>

struct hardware;

typedef void(*hardware_hwq_handler)(void*, struct hardware*);

typedef void(*hardware_hwi_handler)(void*, struct hardware*);

typedef void(*hardware_tick_handler)(void*, struct hardware*);

struct hardware
{
	hardware_hwq_handler hwq;
	hardware_hwi_handler hwi;
	hardware_tick_handler tick;
	void* state;
};

