#include "clock.h"

#include "dcpu.h"

struct clock
{
	uint16_t rate;
	uint16_t clockTicks;
	uint16_t message;
	uint16_t gameTicks;
};

typedef struct clock* CLOCK;

static void hwq_handler(DCPU dcpu, HARDWARE hardware)
{
	if (dcpu == NULL || hardware == NULL)
	{
		return;
	}

	dcpu_set_register(dcpu, REGISTER_A, 0xB402); // Hardware ID (LOW)
	dcpu_set_register(dcpu, REGISTER_B, 0x12D0); // Hardware ID (HIGH)
	dcpu_set_register(dcpu, REGISTER_C, 0x0001); // Version
	dcpu_set_register(dcpu, REGISTER_X, 0x0000); // Manufacturer (LOW)
	dcpu_set_register(dcpu, REGISTER_Y, 0x0000); // Manufacturer (HIGH)
}

static void hwi_handler(DCPU dcpu, HARDWARE hardware)
{
	if (dcpu == NULL || hardware == NULL)
	{
		return;
	}

	uint16_t a = dcpu_get_register(dcpu, REGISTER_A);
	uint16_t b = dcpu_get_register(dcpu, REGISTER_B);

	CLOCK clock = (CLOCK)hardware->state;

	switch(a)
	{
		case 0x0000: // Set tick rate
		{
			if (b == 0)
			{
				clock->rate = 0;
			}
			else
			{
				clock->rate = b;
			}

			clock->clockTicks = 0;
			clock->gameTicks = 0;
			
			break;
		}
		case 0x0001: // Ticks elapsed
		{
			dcpu_set_register(dcpu, REGISTER_C, clock->clockTicks);
			break;
		}
		case 0x0002: // Turn on interrupts
		{
			clock->message = b;
			break;
		}
		default:
		{
			return;
		}
	}
}

static void tick_handler(DCPU dcpu, HARDWARE hardware)
{
	if (dcpu == NULL || hardware == NULL)
	{
		return;
	}

	CLOCK clock = (CLOCK)hardware->state;

	clock->gameTicks++;

	if (clock->gameTicks == clock->rate)
	{
		clock->gameTicks = 0;
		clock->clockTicks++;

		if (clock->message != 0)
		{
			dcpu_interrupt(dcpu, clock->message);
		}
	}
}

static void reset_handler(HARDWARE hardware)
{
	if (hardware == NULL)
	{
		return;
	}

	CLOCK clock = (CLOCK)hardware->state;

	if (clock == NULL)
	{
		return;
	}

	clock->rate = 0x0000;
	clock->clockTicks = 0x0000;
	clock->message = 0x0000;
	clock->gameTicks = 0x0000;
}

static void destroy_handler(HARDWARE hardware)
{
	if (hardware == NULL)
	{
		return;
	}

	free(hardware->state);
}

void clock_initialize(HARDWARE hardware)
{
	if (hardware == NULL)
	{
		return;
	}

	hardware->hwq = hwq_handler;
	hardware->hwi = hwi_handler;
	hardware->tick = tick_handler;
	hardware->reset = reset_handler;
	hardware->destroy = destroy_handler;

	hardware->state = malloc(sizeof(struct clock));

	reset_handler(hardware);
}
