#include "interrupt_queue.h"

//#include <assert.h>
#include <stdlib.h>

#define assert (void)sizeof

struct interrupt_queue* interrupt_queue_create(void)
{
	struct interrupt_queue* self = calloc(1, sizeof(*self));

	if (self == NULL)
	{
		return NULL;
	}

	self->front = 1;
	self->back = 0;
	self->count = 0;

	return self;
}

void interrupt_queue_destroy(struct interrupt_queue* self)
{
	free(self);
}

void interrupt_queue_reset(struct interrupt_queue* self)
{
	assert(self);

	self->front = 1;
	self->back = 0;
	self->count = 0;
}

BOOLINT interrupt_queue_push(struct interrupt_queue* self, uint16_t message)
{
	assert(self);

	if (self->count >= INTERRUPT_QUEUE_CAPACITY)
	{
		return FALSE;
	}

	self->back++;

	if (self->back >= INTERRUPT_QUEUE_CAPACITY)
	{
		self->back = 0;
	}

	self->interrupts[self->back] = message;
	self->count++;

	return TRUE;
}

uint16_t interrupt_queue_pop(struct interrupt_queue* self)
{
	assert(self);

	// TODO: A decision needs to be made on how to handle this error.
	assert(self->count > 0);

	uint16_t message = self->interrupts[self->front];

	self->count--;
	self->front++;

	if (self->front >= INTERRUPT_QUEUE_CAPACITY)
	{
		self->front = 0;
	}

	return message;
}

BOOLINT interrupt_queue_empty(struct interrupt_queue* self)
{
	assert(self);

	return self->count == 0;
}
