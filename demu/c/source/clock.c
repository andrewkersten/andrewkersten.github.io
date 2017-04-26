#include "clock.h"

struct clock
{
	uint16_t rate;
	uint16_t clockTicks;
	uint16_t message;
	uint16_t gameTicks;
};

typedef struct clock* CLOCK;

static void hwq_handler(void* void_dcpu, HARDWARE hardware)
{
	if (void_dcpu == NULL || hardware == NULL)
	{
		return;
	}

	DCPU dcpu = (DCPU)void_dcpu;

	dcpu_set_register(dcpu, REGISTER_A, 0xB402);
	dcpu_set_register(dcpu, REGISTER_B, 0x12D0);
	dcpu_set_register(dcpu, REGISTER_C, 0x0001);
	dcpu_set_register(dcpu, REGISTER_X, 0x0000);
	dcpu_set_register(dcpu, REGISTER_Y, 0x0000);
}

static void hwi_handler(void* void_dcpu, HARDWARE hardware)
{
	if (void_dcpu == NULL || hardware == NULL)
	{
		return;
	}

	DCPU dcpu = (DCPU)void_dcpu;

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

static void tick_handler(void* void_dcpu, HARDWARE hardware)
{
	if (void_dcpu == NULL || hardware == NULL)
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
			DCPU dcpu = (DCPU)void_dcpu;
			dcpu_interrupt(dcpu, clock->message);
		}
	}
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
	hardware->destroy = destroy_handler;

	CLOCK clock = malloc(sizeof(struct clock));

	clock->rate = 0x0000;
	clock->clockTicks = 0x0000;
	clock->message = 0x0000;
	clock->gameTicks = 0x0000;

	hardware->state = clock;
}
