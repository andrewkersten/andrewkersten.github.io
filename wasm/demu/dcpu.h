#pragma once

#include "bool.h"
#include "hardware.h"
#include "register.h"

#include <stdint.h>
#include <stdlib.h>

#define DLLEXPORT

/** The maximum number of hardware devices that can be attached. */
#define DCPU_HARDWARE_CAPACITY 16

/** The size of RAM in bytes. */
#define DCPU_MEMORY_SIZE 65536

/** The speed of the DCPU. */
#define DCPU_CYCLES_PER_SECOND 100000

/** Declare the private structure. */
struct dcpu;

/** An opaque handle to a DCPU. */
typedef struct dcpu* DCPU;

/**
 * Allocates and initializes a DCPU.
 * @return The allocated and initialized DCPU on success, NULL otherwise.
 */
DLLEXPORT DCPU dcpu_create(void);

/**
* Destructor for the DCPU.
* @param dcpu The DCPU instance.
*/
DLLEXPORT void dcpu_destroy(DCPU dcpu);

/**
 * Reset the DCPU to a freshly initialized state.
 * @param dcpu The DCPU instance.
 */
DLLEXPORT void dcpu_reset(DCPU dcpu);

/**
 * Set a DCPU to be powered on.
 * @param dcpu The DCPU instance.
 */
DLLEXPORT void dcpu_power_on(DCPU dcpu);

/**
 * Set a DCPU to be powered off.
 * @param dcpu The DCPU instance.
 */
DLLEXPORT void dcpu_power_off(DCPU dcpu);

/**
 * Write some bytes to DCPU RAM.
 * If the DCPU is powered on it will catch fire.  If attempting to copy more
 * than DCPU_MEMORY_SIZE bytes the DCPU will catch fire.  DCPU_MEMORY_SIZE
 * bytes will be successfully copied into RAM however.
 * @param dcpu The DCPU instance.
 * @param bytes The bytes to write.
 * @param length The number of bytes to write.
 */
DLLEXPORT void dcpu_flash(DCPU dcpu, char* bytes, size_t length);

/**
 * Attach a piece of hardware to the DCPU.
 * A DCPU can have up to DCPU_HARDWARE_CAPACITY pieces of hardware attached to
 * it. The DCPU is not hot swappable. Attaching hardware to the DCPU while it
 * is powered on will cause the DCPU to catch on fire.
 * @param dcpu The DCPU instance.
 * @param hardware The hardware to attach.
 * @return TRUE on success, FALSE otherwise.
 */
DLLEXPORT BOOLINT dcpu_attach(DCPU dcpu, struct hardware hardware);

/**
 * Simulate one clock cycle.
 * The DCPU must be powered on and not on fire for this to have an effect.
 * @param dcpu The DCPU instance.
 */
DLLEXPORT void dcpu_cycle(DCPU dcpu);

/**
 * Simulate the passed in number of clock cycles.
 * The DCPU must be powered on and not on fire for this to have an effect.
 * @param dcpu The DCPU instance.
 * @param cycles The number of cycles to simulate.
 */
DLLEXPORT void dcpu_process(DCPU dcpu, size_t cycles);

/**
 * Trigger an interrupt.
 * The DCPU must be powered on and not on fire for this to have an effect.  If
 * interrupt queueing is enabled the message will be added to the
 * interrupt_queue to be processed later, otherwise it will be processed after
 * the current instruction completes.
 * @param dcpu The DCPU instance.
 * @param message The message to send the DCPU.
 */
DLLEXPORT void dcpu_interrupt(DCPU dcpu, uint16_t message);

/**
 * Write a value to a register.
 * The DCPU must be powered on and not on fire for this to have an effect.
 * @param dcpu The DCPU instance.
 * @param r The register to write to.
 * @param value The value write.
 */
DLLEXPORT void dcpu_set_register(DCPU dcpu, enum Register r, uint16_t value);

/**
* Read a value from a register.
* The DCPU must be powered on and not on fire for this to have an effect.
* @param dcpu The DCPU instance.
* @param r The register to read from.
* @return The value of the register.
*/
DLLEXPORT uint16_t dcpu_get_register(DCPU dcpu, enum Register r);
