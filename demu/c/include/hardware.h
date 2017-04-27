#pragma once

#include <stdint.h>

struct dcpu;

typedef struct dcpu* DCPU;

struct hardware;

typedef struct hardware* HARDWARE;

/**
 * The HWQ handler is called whenever the @param dcpu encounters an HWQ instruction targeting this device.
 * @param dcpu The DCPU instance.
 * @param hardware The hardware instance.
 */
typedef void(*hardware_hwq_handler)(DCPU dcpu, HARDWARE hardware);

/**
 * The HWI handler is called whenever the @param dcpu encounters an HWI instruction targeting this device.
 * @param dcpu The DCPU instance.
 * @param hardware The hardware instance.
 */
typedef void(*hardware_hwi_handler)(DCPU dcpu, HARDWARE hardware);

/**
 * The tick handler is called whenever the @param dcpu is ticked.
 * @param dcpu The DCPU instance.
 * @param hardware The hardware instance.
 */
typedef void(*hardware_tick_handler)(DCPU dcpu, HARDWARE hardware);

/**
 * The reset handler is called when the @param dcpu wants the device to be set to its default state.
 * @param hardware The hardware instance.
 */
typedef void(*hardware_reset_handler)(HARDWARE hardware);

/**
 * The destroy handler is called when the @param hardware is being destroyed.
 * The handler is expected to free the state.
 * @param hardware The hardware instance.
 */
typedef void(*hardware_destroy_handler)(HARDWARE hardware);

/**
 * The state and collection of handlers that define a hardware device instance.
 */
struct hardware
{
	hardware_hwq_handler hwq;
	hardware_hwi_handler hwi;
	hardware_tick_handler tick;
	hardware_reset_handler reset;
	hardware_destroy_handler destroy;

	/** Store instance specific state here. */
	void* state;
};

