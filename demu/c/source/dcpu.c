#include "dcpu.h"

#include "interrupt_queue.h"

#include <stdint.h>
#include <stdlib.h>
#include <string.h>

/** A lookup table for the cost in cycles to process an operand. */
static const size_t operand_cost[] = {
	0, 0, 0, 0, 0, 0, 0, 0, // 0x00 - 0x07: register
	0, 0, 0, 0, 0, 0, 0, 0, // 0x08 - 0x0F: [register]
	1, 1, 1, 1, 1, 1, 1, 1, // 0x10 - 0x17: [register + next word]
	0, // 0x18: PUSH / POP
	0, // 0x19: PEEK
	1, // 0x1A: PICK
	0, // 0x1B: SP
	0, // 0x1C: PC
	0, // 0x1D: EX
	1, // 0x1E: [next word]
	1, // 0x1F: next word
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 0x20 - 0x2F: literal
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 0x30 - 0x3F: literal
};

/** A lookup table for the cost in cycles to perform a basic opcode. */
static const size_t basic_opcode_cost[] = {
	0, // 0x00 - SPECIAL
	1, // 0x01 - SET
	2, // 0x02 - ADD
	2, // 0x03 - SUB
	2, // 0x04 - MUL
	2, // 0x05 - MLI
	3, // 0x06 - DIV
	3, // 0x07 - DVI
	3, // 0x08 - MOD
	3, // 0x09 - MDI
	1, // 0x0A - AND
	1, // 0x0B - BOR
	1, // 0x0C - XOR
	1, // 0x0D - SHR
	1, // 0x0E - ASR
	1, // 0x0F - SHL
	2, // 0x10 - IFB
	2, // 0x11 - IFC
	2, // 0x12 - IFE
	2, // 0x13 - IFN
	2, // 0x14 - IFG
	2, // 0x15 - IFA
	2, // 0x16 - IFL
	2, // 0x17 - IFU
	0, // 0x18 - UNUSED
	0, // 0x19 - UNUSED
	3, // 0x1A - ADX
	3, // 0x1B - SBX
	0, // 0x1C - UNUSED
	0, // 0x1D - UNUSED
	2, // 0x1E - STI
	2, // 0x1F - STD
};

/** A lookup table for the cost in cycles to perform an advanced opcode. */
static const size_t special_opcode_cost[] = {
	0, // 0x00 - RESERVED
	3, // 0x01 - JSR
	0, // 0x02 - UNUSED
	0, // 0x03 - UNUSED
	0, // 0x04 - UNUSED
	0, // 0x05 - UNUSED
	0, // 0x06 - UNUSED
	0, // 0x07 - UNUSED
	4, // 0x08 - INT
	1, // 0x09 - IAG
	1, // 0x0A - IAS
	3, // 0x0B - RFI
	2, // 0x0C - IAQ
	0, // 0x0D - UNUSED
	0, // 0x0E - UNUSED
	0, // 0x0F - UNUSED
	2, // 0x10 - HWN
	4, // 0x11 - HWQ
	4, // 0x12 - HWI
	0, // 0x13 - UNUSED
	0, // 0x14 - UNUSED
	0, // 0x15 - UNUSED
	0, // 0x16 - UNUSED
	0, // 0x17 - UNUSED
	0, // 0x18 - UNUSED
	0, // 0x19 - UNUSED
	0, // 0x1A - UNUSED
	0, // 0x1B - UNUSED
	0, // 0x1C - UNUSED
	0, // 0x1D - UNUSED
	0, // 0x1E - UNUSED
	0, // 0x1F - UNUSED
};

/** The default LEM1802 palette */
static uint16_t lem1802_palette_default[16] = {
	0x0000,
	0x000a,
	0x00a0,
	0x00aa,
	0x0a00,
	0x0a0a,
	0x0a50,
	0x0aaa,
	0x0555,
	0x055f,
	0x05f5,
	0x05ff,
	0x0f55,
	0x0f5f,
	0x0ff5,
	0x0fff
};

/** The default LEM1802 font */
static uint16_t lem1802_font_default[256] = {
	0x000f, 0x0808, 0x080f, 0x0808, 0x08f8, 0x0808, 0x00ff, 0x0808,
	0x0808, 0x0808, 0x08ff, 0x0808, 0x00ff, 0x1414, 0xff00, 0xff08,
	0x1f10, 0x1714, 0xfc04, 0xf414, 0x1710, 0x1714, 0xf404, 0xf414,
	0xff00, 0xf714, 0x1414, 0x1414, 0xf700, 0xf714, 0x1417, 0x1414,
	0x0f08, 0x0f08, 0x14f4, 0x1414, 0xf808, 0xf808, 0x0f08, 0x0f08,
	0x001f, 0x1414, 0x00fc, 0x1414, 0xf808, 0xf808, 0xff08, 0xff08,
	0x14ff, 0x1414, 0x080f, 0x0000, 0x00f8, 0x0808, 0xffff, 0xffff,
	0xf0f0, 0xf0f0, 0xffff, 0x0000, 0x0000, 0xffff, 0x0f0f, 0x0f0f,
	0x0000, 0x0000, 0x005f, 0x0000, 0x0300, 0x0300, 0x3e14, 0x3e00,
	0x266b, 0x3200, 0x611c, 0x4300, 0x3629, 0x7650, 0x0002, 0x0100,
	0x1c22, 0x4100, 0x4122, 0x1c00, 0x2a1c, 0x2a00, 0x083e, 0x0800,
	0x4020, 0x0000, 0x0808, 0x0800, 0x0040, 0x0000, 0x601c, 0x0300,
	0x3e41, 0x3e00, 0x427f, 0x4000, 0x6259, 0x4600, 0x2249, 0x3600,
	0x0f08, 0x7f00, 0x2745, 0x3900, 0x3e49, 0x3200, 0x6119, 0x0700,
	0x3649, 0x3600, 0x2649, 0x3e00, 0x0024, 0x0000, 0x4024, 0x0000,
	0x0814, 0x2241, 0x1414, 0x1400, 0x4122, 0x1408, 0x0259, 0x0600,
	0x3e59, 0x5e00, 0x7e09, 0x7e00, 0x7f49, 0x3600, 0x3e41, 0x2200,
	0x7f41, 0x3e00, 0x7f49, 0x4100, 0x7f09, 0x0100, 0x3e49, 0x3a00,
	0x7f08, 0x7f00, 0x417f, 0x4100, 0x2040, 0x3f00, 0x7f0c, 0x7300,
	0x7f40, 0x4000, 0x7f06, 0x7f00, 0x7f01, 0x7e00, 0x3e41, 0x3e00,
	0x7f09, 0x0600, 0x3e41, 0xbe00, 0x7f09, 0x7600, 0x2649, 0x3200,
	0x017f, 0x0100, 0x7f40, 0x7f00, 0x1f60, 0x1f00, 0x7f30, 0x7f00,
	0x7708, 0x7700, 0x0778, 0x0700, 0x7149, 0x4700, 0x007f, 0x4100,
	0x031c, 0x6000, 0x0041, 0x7f00, 0x0201, 0x0200, 0x8080, 0x8000,
	0x0001, 0x0200, 0x2454, 0x7800, 0x7f44, 0x3800, 0x3844, 0x2800,
	0x3844, 0x7f00, 0x3854, 0x5800, 0x087e, 0x0900, 0x4854, 0x3c00,
	0x7f04, 0x7800, 0x447d, 0x4000, 0x2040, 0x3d00, 0x7f10, 0x6c00,
	0x417f, 0x4000, 0x7c18, 0x7c00, 0x7c04, 0x7800, 0x3844, 0x3800,
	0x7c14, 0x0800, 0x0814, 0x7c00, 0x7c04, 0x0800, 0x4854, 0x2400,
	0x043e, 0x4400, 0x3c40, 0x7c00, 0x1c60, 0x1c00, 0x7c30, 0x7c00,
	0x6c10, 0x6c00, 0x4c50, 0x3c00, 0x6454, 0x4c00, 0x0836, 0x4100,
	0x0077, 0x0000, 0x4136, 0x0800, 0x0201, 0x0201, 0x704c, 0x7000
};

enum dcpu_fsm_state
{
	DCPU_FSM_DECODE_INSTRUCTION,
	DCPU_FSM_DECODE_OPERAND_B,
	DCPU_FSM_PERFORM_OPERATION,
	DCPU_FSM_SKIP_OPERATION,
};

struct dcpu
{
	BOOLINT running;
	BOOLINT skip;
	BOOLINT fire;
	BOOLINT queue_interrupts;

	enum
	{
		DCPU_DECODE_INSTRUCTION,
		DCPU_LOOK_UP_OPERAND_B,
		DCPU_PERFORM_OPERATION,
		DCPU_INSTRUCTION_SKIP,
	} state;

	uint16_t opcode;
	uint16_t operand_code_a;
	uint16_t operand_code_b;
	uint16_t* operand_a;
	uint16_t* operand_b;
	size_t operation_cost;

	struct interrupt_queue* interrupt_queue;

	struct hardware hardware[DCPU_HARDWARE_CAPACITY];
	size_t hardware_count;

	uint16_t registers[REGISTER_COUNT];
	uint16_t* memory;
};

DCPU dcpu_create(void)
{
	DCPU dcpu = malloc(sizeof(struct dcpu));

	if (dcpu == NULL)
	{
		return NULL;
	}

	dcpu->memory = calloc(DCPU_MEMORY_SIZE, 1);

	dcpu->interrupt_queue = interrupt_queue_create();

	dcpu->running = FALSE;

	dcpu->hardware_count = 0;

	dcpu_reset(dcpu);

	return dcpu;
}

void dcpu_destroy(DCPU dcpu)
{
	if (dcpu == NULL)
	{
		return;
	}

	interrupt_queue_destroy(dcpu->interrupt_queue);

	free(dcpu->memory);

	// TODO: Notify hardware?

	free(dcpu);
}

void dcpu_reset(DCPU dcpu)
{
	if (dcpu == NULL)
	{
		return;
	}

	dcpu->fire = FALSE;
	dcpu->skip = FALSE;
	dcpu->queue_interrupts = FALSE;

	interrupt_queue_reset(dcpu->interrupt_queue);

	dcpu->state = DCPU_DECODE_INSTRUCTION;

	dcpu->registers[REGISTER_A] = 0x0000;
	dcpu->registers[REGISTER_B] = 0x0000;
	dcpu->registers[REGISTER_C] = 0x0000;
	dcpu->registers[REGISTER_X] = 0x0000;
	dcpu->registers[REGISTER_Y] = 0x0000;
	dcpu->registers[REGISTER_Z] = 0x0000;
	dcpu->registers[REGISTER_I] = 0x0000;
	dcpu->registers[REGISTER_J] = 0x0000;
	dcpu->registers[REGISTER_PC] = 0x0000;
	dcpu->registers[REGISTER_SP] = 0xFFFF;
	dcpu->registers[REGISTER_EX] = 0x0000;
	dcpu->registers[REGISTER_IA] = 0x0000;

	memset(dcpu->memory, 0, DCPU_MEMORY_SIZE);
}

void dcpu_power_on(DCPU dcpu)
{
	if (dcpu == NULL)
	{
		return;
	}

	//dcpu_reset(dcpu);
	dcpu->running = TRUE;
}

void dcpu_power_off(DCPU dcpu)
{
	if (dcpu == NULL)
	{
		return;
	}

	dcpu->running = FALSE;
}

void dcpu_flash(DCPU dcpu, char* bytes, size_t length)
{
	if (dcpu == NULL)
	{
		return;
	}

	if (dcpu->running == TRUE)
	{
		dcpu->fire = TRUE;

		return;
	}

	//memcpy(dcpu->memory, bytes, min(length, DCPU_MEMORY_SIZE));
	memcpy(dcpu->memory, bytes, length > DCPU_MEMORY_SIZE ? DCPU_MEMORY_SIZE : length);

	if (length > DCPU_MEMORY_SIZE)
	{
		dcpu->fire = TRUE;
	}
}

HARDWARE dcpu_attach(DCPU dcpu)
{
	if (dcpu == NULL)
	{
		return NULL;
	}

	if (dcpu->hardware_count >= DCPU_HARDWARE_CAPACITY)
	{
		return NULL;
	}

	if (dcpu->running == TRUE)
	{
		dcpu->fire = TRUE;
	}

	return &dcpu->hardware[dcpu->hardware_count++];
}

static uint16_t* operand_address(DCPU dcpu, uint16_t operand, BOOLINT is_operand_a)
{
	switch (operand)
	{
	case 0x00: // A
		return &dcpu->registers[REGISTER_A];
	case 0x01: // B
		return &dcpu->registers[REGISTER_B];
	case 0x02: // C
		return &dcpu->registers[REGISTER_C];
	case 0x03: // X
		return &dcpu->registers[REGISTER_X];
	case 0x04: // Y
		return &dcpu->registers[REGISTER_Y];
	case 0x05: // Z
		return &dcpu->registers[REGISTER_Z];
	case 0x06: // I
		return &dcpu->registers[REGISTER_I];
	case 0x07: // J
		return &dcpu->registers[REGISTER_J];
	case 0x08: // [A]
		return &dcpu->memory[dcpu->registers[REGISTER_A]];
	case 0x09: // [B]
		return &dcpu->memory[dcpu->registers[REGISTER_B]];
	case 0x0a: // [C]
		return &dcpu->memory[dcpu->registers[REGISTER_C]];
	case 0x0b: // [X]
		return &dcpu->memory[dcpu->registers[REGISTER_X]];
	case 0x0c: // [Y]
		return &dcpu->memory[dcpu->registers[REGISTER_Y]];
	case 0x0d: // [Z]
		return &dcpu->memory[dcpu->registers[REGISTER_Z]];
	case 0x0e: // [I]
		return &dcpu->memory[dcpu->registers[REGISTER_I]];
	case 0x0f: // [J]
		return &dcpu->memory[dcpu->registers[REGISTER_J]];
	case 0x10: // [A + next word]
		return &dcpu->memory[dcpu->registers[REGISTER_A] + dcpu->memory[dcpu->registers[REGISTER_PC]++]];
	case 0x11: // [B + next word]
		return &dcpu->memory[dcpu->registers[REGISTER_B] + dcpu->memory[dcpu->registers[REGISTER_PC]++]];
	case 0x12: // [C + next word]
		return &dcpu->memory[dcpu->registers[REGISTER_C] + dcpu->memory[dcpu->registers[REGISTER_PC]++]];
	case 0x13: // [X + next word]
		return &dcpu->memory[dcpu->registers[REGISTER_X] + dcpu->memory[dcpu->registers[REGISTER_PC]++]];
	case 0x14: // [Y + next word]
		return &dcpu->memory[dcpu->registers[REGISTER_Y] + dcpu->memory[dcpu->registers[REGISTER_PC]++]];
	case 0x15: // [Z + next word]
		return &dcpu->memory[dcpu->registers[REGISTER_Z] + dcpu->memory[dcpu->registers[REGISTER_PC]++]];
	case 0x16: // [I + next word]
		return &dcpu->memory[dcpu->registers[REGISTER_I] + dcpu->memory[dcpu->registers[REGISTER_PC]++]];
	case 0x17: // [J + next word]
		return &dcpu->memory[dcpu->registers[REGISTER_J] + dcpu->memory[dcpu->registers[REGISTER_PC]++]];
	case 0x18: // POP [SP++] / PUSH [SP--]
		if (is_operand_a) // POP [SP++]
		{
			return &dcpu->memory[++dcpu->registers[REGISTER_SP]];
		}
		else // PUSH [SP--]
		{
			return &dcpu->memory[dcpu->registers[REGISTER_SP]--];
		}
	case 0x19: // PEEK [SP]
		return &dcpu->memory[dcpu->registers[REGISTER_SP]];
	case 0x1a: // PICK [SP + next word]
		return &dcpu->memory[dcpu->registers[REGISTER_SP] + dcpu->memory[dcpu->registers[REGISTER_PC]++]];
	case 0x1b: // SP
		return &dcpu->registers[REGISTER_SP];
	case 0x1c: // PC
		return &dcpu->registers[REGISTER_PC];
	case 0x1d: // EX
		return &dcpu->registers[REGISTER_EX];
	case 0x1e: // [next word]
		return &dcpu->memory[dcpu->memory[dcpu->registers[REGISTER_PC]++]];
	case 0x1f: // next word
		return &dcpu->memory[dcpu->registers[REGISTER_PC]++];
	}

	return NULL;
}

static void dcpu_push(DCPU dcpu, uint16_t value)
{
	dcpu->memory[--dcpu->registers[REGISTER_SP]] = value;
}

static void dcpu_operation_cost(DCPU dcpu)
{
	if (dcpu->operand_code_a == 0)
	{
		dcpu->operation_cost = special_opcode_cost[dcpu->operand_code_b];
	}
	else
	{
		dcpu->operation_cost = basic_opcode_cost[dcpu->opcode];
	}
}

static void decode_instruction(DCPU dcpu)
{
	uint16_t instruction = dcpu->memory[dcpu->registers[REGISTER_PC]++];

	dcpu->opcode = instruction & 0x1F;
	dcpu->operand_code_a = instruction >> 10;
	dcpu->operand_code_b = (instruction >> 5) & 0x1F;
}

void dcpu_cycle(DCPU dcpu)
{
	if (dcpu == NULL)
	{
		return;
	}

	if (dcpu->running == FALSE || dcpu->fire == TRUE)
	{
		return;
	}

	BOOLINT exit = FALSE;

	while (exit == FALSE)
	{
		switch (dcpu->state)
		{
			case DCPU_DECODE_INSTRUCTION:
			{
				// Should we process an interrupt?
				if (dcpu->queue_interrupts == FALSE)
				{
					if (interrupt_queue_empty(dcpu->interrupt_queue) == FALSE)
					{
						dcpu->queue_interrupts = TRUE;

						dcpu_push(dcpu, dcpu->registers[REGISTER_PC]);
						dcpu_push(dcpu, dcpu->registers[REGISTER_A]);

						dcpu->registers[REGISTER_PC] = dcpu->registers[REGISTER_IA];
						dcpu->registers[REGISTER_A] = interrupt_queue_pop(dcpu->interrupt_queue);
					}
				}

				// Decode the next instruction and look up the cost.
				decode_instruction(dcpu);
				dcpu_operation_cost(dcpu);

				// Look up operand A.
				dcpu->operand_a = operand_address(dcpu, dcpu->operand_code_a, TRUE);

				// If looking up this operand had a cost this cycle is complete.
				if (operand_cost[dcpu->operand_code_a] > 0)
				{
					exit = TRUE;
				}

				// If this is a special instruction (opcode == 0) then we can
				// go ahead and perform the operation.  If not we need to look
				// up operand B.
				if (dcpu->opcode == 0)
				{
					dcpu->state = DCPU_PERFORM_OPERATION;
				}
				else
				{
					dcpu->state = DCPU_LOOK_UP_OPERAND_B;
				}

				break;
			}
			case DCPU_LOOK_UP_OPERAND_B:
			{
				// Look up operand B.
				dcpu->operand_b = operand_address(dcpu, dcpu->operand_code_b, FALSE);

				// If looking up this operand had a cost this cycle is complete.
				if (operand_cost[dcpu->operand_code_b] > 0)
				{
					exit = TRUE;
				}

				dcpu->state = DCPU_PERFORM_OPERATION;
				break;
			}
			case DCPU_PERFORM_OPERATION:
			{
				if (dcpu->operation_cost > 1)
				{
					dcpu->operation_cost--;
				}
				else
				{
					dcpu->state = DCPU_DECODE_INSTRUCTION;

					switch (dcpu->opcode)
					{
						case 0x00: // Special Opcodes
						{
							switch (dcpu->operand_code_b)
							{
								case 0x01: // JSR
								{
									dcpu->memory[dcpu->registers[REGISTER_SP]--] = dcpu->registers[REGISTER_PC];
									dcpu->registers[REGISTER_PC] = *dcpu->operand_a;
									break;
								}
								case 0x08: // INT
								{
									dcpu_interrupt(dcpu, *dcpu->operand_a);
									break;
								}
								case 0x09: // IAG
								{
									*dcpu->operand_a = dcpu->registers[REGISTER_IA];
									break;
								}
								case 0x0A: // IAS
								{
									dcpu->registers[REGISTER_IA] = *dcpu->operand_a;
									break;
								}
								case 0x0B: // RFI
								{
									dcpu->queue_interrupts = FALSE;

									dcpu->registers[REGISTER_A] = dcpu->memory[dcpu->registers[REGISTER_SP]++];
									dcpu->registers[REGISTER_PC] = dcpu->memory[dcpu->registers[REGISTER_SP]++];

									break;
								}
								case 0x0C: // IAQ
								{
									dcpu->queue_interrupts = (*dcpu->operand_a == 0);
									break;
								}
								case 0x10: // HWN
								{
									*dcpu->operand_a = (uint16_t)dcpu->hardware_count;
									break;
								}
								case 0x11: // HWQ
								{
									uint16_t hardware_index = *dcpu->operand_a;

									if (hardware_index >= dcpu->hardware_count)
									{
										dcpu->registers[REGISTER_A] = 0x0000;
										dcpu->registers[REGISTER_B] = 0x0000;
										dcpu->registers[REGISTER_C] = 0x0000;
										dcpu->registers[REGISTER_X] = 0x0000;
										dcpu->registers[REGISTER_Y] = 0x0000;
									}
									else
									{
										dcpu->hardware[hardware_index].hwq(dcpu, &dcpu->hardware[hardware_index]);
									}

									break;
								}
								case 0x12: // HWI
								{
									uint16_t hardware_index = *dcpu->operand_a;

									if (hardware_index >= dcpu->hardware_count)
									{
										// BAD HARDWARE_INDEX... FIRE?
									}
									else
									{
										dcpu->hardware[hardware_index].hwi(dcpu, &dcpu->hardware[hardware_index]);
									}

									break;
								}
								default:
								{
									// TODO: ERROR!
									break;
								}
							}

							break;
						}

						// Basic Opcodes

						case 0x01: // SET
						{
							*dcpu->operand_b = *dcpu->operand_a;
							break;
						}
						case 0x02: // ADD
						{
							if (*dcpu->operand_a > 0xFFFF - *dcpu->operand_b)
							{
								dcpu->registers[REGISTER_EX] = 0x0001;
							}

							dcpu->registers[REGISTER_EX] = 0x0000;

							*dcpu->operand_b += *dcpu->operand_a;

							break;
						}
						case 0x03: // SUB
						{
							if (*dcpu->operand_a > *dcpu->operand_b)
							{
								dcpu->registers[REGISTER_EX] = 0xFFFF;
							}

							dcpu->registers[REGISTER_EX] = 0x0000;

							*dcpu->operand_b -= *dcpu->operand_a;

							break;
						}
						case 0x04: // MUL
						{
							uint32_t b = *dcpu->operand_b;
							uint32_t a = *dcpu->operand_a;

							dcpu->registers[REGISTER_EX] = ((b * a) >> 16) & 0xFFFF;

							*dcpu->operand_b *= *dcpu->operand_a;

							break;
						}
						/*
						case 0x05: // MLI
						{
							break;
						}
						*/
						case 0x06: // DIV
						{
							if (*dcpu->operand_a == 0)
							{
								dcpu->registers[REGISTER_EX] = 0;

								*dcpu->operand_b = 0;
							}
							else
							{
								uint32_t b = *dcpu->operand_b;
								uint32_t a = *dcpu->operand_a;

								dcpu->registers[REGISTER_EX] = ((b << 16) / a) & 0xFFFF;

								*dcpu->operand_b /= *dcpu->operand_a;
							}
							
							break;
						}
						/*
						case 0x07: // DVI
						{
							break;
						}
						*/
						case 0x08: // MOD
						{
							if (*dcpu->operand_a == 0)
							{
								*dcpu->operand_b = 0;
							}
							else
							{
								*dcpu->operand_b = *dcpu->operand_b % *dcpu->operand_a;
							}

							break;
						}
						/*
						case 0x09: // MDI
						{
							break;
						}
						*/
						case 0x0A: // AND
						{
							*dcpu->operand_b &= *dcpu->operand_a;
							break;
						}
						case 0x0B: // BOR
						{
							*dcpu->operand_b |= *dcpu->operand_a;
							break;
						}
						case 0x0C: // XOR
						{
							*dcpu->operand_b ^= *dcpu->operand_a;
							break;
						}
						case 0x0D: // SHR
						{
							uint32_t b = *dcpu->operand_b;
							uint32_t a = *dcpu->operand_a;

							dcpu->registers[REGISTER_EX] = ((b << 16) >> a) & 0xFFFF;

							*dcpu->operand_b >>= *dcpu->operand_a;

							break;
						}
						/*
						case 0x0E: // ASR
						{
							break;
						}
						*/
						case 0x0F: // SHL
						{
							uint32_t b = *dcpu->operand_b;
							uint32_t a = *dcpu->operand_a;

							dcpu->registers[REGISTER_EX] = ((b << a) >> 16) & 0xFFFF;

							*dcpu->operand_b <<= *dcpu->operand_a;

							break;
						}
						case 0x10: // IFB
						{
							if (((*dcpu->operand_b) & (*dcpu->operand_a)) == 0)
							{
								dcpu->state = DCPU_INSTRUCTION_SKIP;
							}

							break;
						}
						case 0x11: // IFC
						{
							if (((*dcpu->operand_b) & (*dcpu->operand_a)) != 0)
							{
								dcpu->state = DCPU_INSTRUCTION_SKIP;
							}

							break;
						}
						case 0x12: // IFE
						{
							if ((*dcpu->operand_a) != (*dcpu->operand_b))
							{
								dcpu->state = DCPU_INSTRUCTION_SKIP;
							}

							break;
						}
						case 0x13: // IFN
						{
							if ((*dcpu->operand_a) == (*dcpu->operand_b))
							{
								dcpu->state = DCPU_INSTRUCTION_SKIP;
							}

							break;
						}
						case 0x14: // IFG
						{
							if ((*dcpu->operand_a) >= (*dcpu->operand_b))
							{
								dcpu->state = DCPU_INSTRUCTION_SKIP;
							}

							break;
						}
						/*
						case 0x15: // IFA
						{
							break;
						}
						*/
						case 0x16: // IFL
						{
							if ((*dcpu->operand_a) <= (*dcpu->operand_b))
							{
								dcpu->state = DCPU_INSTRUCTION_SKIP;
							}

							break;
						}
						/*
						case 0x17: // IFU
						{
							break;
						}
						*/
						case 0x1A: // ADX
						{
							if (*dcpu->operand_a > 0xFFFF - *dcpu->operand_b)
							{
								dcpu->registers[REGISTER_EX] = 0x0001;
							}
							else
							{
								uint16_t r = *dcpu->operand_b + *dcpu->operand_a;

								if (r > 0xFFFF - dcpu->registers[REGISTER_EX])
								{
									dcpu->registers[REGISTER_EX] = 0x0001;
								}
								else
								{
									dcpu->registers[REGISTER_EX] = 0x0000;
								}
							}

							*dcpu->operand_b += *dcpu->operand_a + dcpu->registers[REGISTER_EX];

							break;
						}
						/*
						case 0x1B: // SBX
						{
							break;
						}
						*/
						case 0x1E: // STI
						{
							*dcpu->operand_b = *dcpu->operand_a;

							dcpu->registers[REGISTER_I]++;
							dcpu->registers[REGISTER_J]++;

							break;
						}
						case 0x1F: // STD
						{
							*dcpu->operand_b = *dcpu->operand_a;

							dcpu->registers[REGISTER_I]--;
							dcpu->registers[REGISTER_J]--;

							break;
						}
						default:
						{
							// TODO: Error!
							break;
						}
					}
				}
				
				exit = TRUE;
				break;
			}
			case DCPU_INSTRUCTION_SKIP:
			{
				decode_instruction(dcpu);

				// Looking up operand addresses will advance REGISTER_PC over
				// extra words used in the instruction.  (Instructions are 1-3
				// words long)
				uint16_t* unused = NULL;

				unused = operand_address(dcpu, dcpu->operand_code_a, TRUE);

				if (dcpu->opcode != 0)
				{
					unused = operand_address(dcpu, dcpu->operand_code_b, FALSE);
				}

				// If the instruction is an IF instruction we will skip an
				// additional instruction.  Otherwise we can go ahead and switch
				// to the DECODE_INSTRUCTION state.
				switch (dcpu->opcode)
				{
					case 0x10: // IFB
					case 0x11: // IFC
					case 0x12: // IFE
					case 0x13: // IFN
					case 0x14: // IFG
					case 0x15: // IFA
					case 0x16: // IFL
					case 0x17: // IFU
						break;
					default:
						dcpu->state = DCPU_DECODE_INSTRUCTION;
						break;
				}

				exit = TRUE;
				break;
			}
		}
	}
}

void dcpu_process(DCPU dcpu, size_t cycles)
{
	if (dcpu == NULL)
	{
		return;
	}

	for (size_t i = 0; i < cycles; i++)
	{
		dcpu_cycle(dcpu);
	}
}

void dcpu_interrupt(DCPU dcpu, uint16_t message)
{
	if (dcpu == NULL)
	{
		return;
	}

	if (interrupt_queue_push(dcpu->interrupt_queue, message) == FALSE)
	{
		dcpu->fire = TRUE;
	}
}

void dcpu_set_register(DCPU dcpu, enum Register r, uint16_t value)
{
	if (dcpu == NULL)
	{
		return;
	}

	dcpu->registers[r] = value;
}

uint16_t dcpu_get_register(DCPU dcpu, enum Register r)
{
	if (dcpu == NULL)
	{
		return 0;
	}

	return dcpu->registers[r];
}

uint16_t* dcpu_memory(DCPU dcpu)
{
	if (dcpu == NULL)
	{
		return NULL;
	}

	return dcpu->memory;
}
