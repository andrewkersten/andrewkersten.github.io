#pragma once

#include <stdint.h>

struct hardware;

typedef struct hardware* HARDWARE;

typedef void(*hardware_hwq_handler)(void*, HARDWARE);

typedef void(*hardware_hwi_handler)(void*, HARDWARE);

typedef void(*hardware_tick_handler)(void*, HARDWARE);

typedef void(*hardware_destroy_handler)(HARDWARE);

struct hardware
{
	hardware_hwq_handler hwq;
	hardware_hwi_handler hwi;
	hardware_tick_handler tick;
	hardware_destroy_handler destroy;
	void* state;
};

