#pragma once

#include "bool.h"

#include <stddef.h>
#include <stdint.h>

/** The maximum number of messages an interrupt_queue can hold. */ 
#define INTERRUPT_QUEUE_CAPACITY 256

/**
 * The interrupt_queue is a data structure to store interrupt messages to be
 * processed by a DCPU at some later point.
 */
struct interrupt_queue
{
	/** The number of messages currently in the queue. */
	size_t count;

	/** The front of the queue. (Oldest element)*/
	size_t front;

	/** The back of the queue. (Newest element)*/
	size_t back;

	/** Messages are written into this array. */
	uint16_t interrupts[INTERRUPT_QUEUE_CAPACITY];
};

/**
 * Allocates and initializes an interrupt_queue structure.
 * @return The allocated and initialized interrupt queue on success, NULL
 * otherwise.
 */
struct interrupt_queue* interrupt_queue_create(void);

/**
 * Destructor for the interrupt_queue structure.
 * @param self The interrupt_queue instance.
 */
void interrupt_queue_destroy(struct interrupt_queue* self);

/**
 * Resets the interrupt_queue to a freshly initialized state.
 * @param self The interrupt_queue instance.
 */
void interrupt_queue_reset(struct interrupt_queue* self);

/**
 * Pushes a message onto the interrupt_queue.
 * @param self The interrupt_queue instance.
 * @param message The message to push.
 * @return TRUE on success, FALSE otherwise.
 */
BOOLINT interrupt_queue_push(struct interrupt_queue* self, uint16_t message);

/**
 * Pops a message off the interrupt_queue.
 * @param self The interrupt_queue instance.
 * @return A message from the interrupt_queue.
 */
uint16_t interrupt_queue_pop(struct interrupt_queue* self);

/**
 * Checks if the interrupt_queue is empty.
 * @param self The interrupt_queue instance.
 * @return TRUE if empty, FALSE otherwise.
 */
BOOLINT interrupt_queue_empty(struct interrupt_queue* self);
