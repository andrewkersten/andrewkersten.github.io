#include "lem1802.h"

#include "register.h"

#include <stdlib.h>

#define LEM1802_USE_DEFAULT 0x0000

/** The default LEM1802 palette */
static uint16_t default_palette[16] = {
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
static uint16_t default_font[256] = {
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

struct lem1802
{
	uint16_t vram;
	uint16_t fram;
	uint16_t pram;
	uint16_t border;
};

typedef struct lem1802* LEM1802;

static void hwq_handler(void* void_dcpu, HARDWARE hardware)
{
	if (void_dcpu == NULL || hardware == NULL)
	{
		return;
	}

	DCPU dcpu = (DCPU)void_dcpu;

	dcpu_set_register(dcpu, REGISTER_A, 0xF615);
	dcpu_set_register(dcpu, REGISTER_B, 0x7349);
	dcpu_set_register(dcpu, REGISTER_C, 0x1802);
	dcpu_set_register(dcpu, REGISTER_X, 0x8B36);
	dcpu_set_register(dcpu, REGISTER_Y, 0x1C6C);
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

	LEM1802 lem1802 = (LEM1802)hardware->state;

	if (lem1802 == NULL)
	{
		return;
	}

	switch(a)
	{
		case 0x0000: // MEM_MAP_SCREEN
		{
			lem1802->vram = b;
			break;
		}
		case 0x0001: // MEM_MAP_FONT
		{
			lem1802->fram = b;
			break;
		}
		case 0x0002: // MEM_MAP_PALETTE
		{
			lem1802->pram = b;
			break;
		}
		case 0x0003: // SET_BORDER_COLOR
		{
			lem1802->border = b & 0xF;
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
}

static void destroy_handler(HARDWARE hardware)
{
	if (hardware == NULL)
	{
		return;
	}

	free(hardware->state);
}

void lem1802_initialize(HARDWARE hardware)
{
	if (hardware == NULL)
	{
		return;
	}

	hardware->hwq = hwq_handler;
	hardware->hwi = hwi_handler;
	hardware->tick = tick_handler;
	hardware->destroy = destroy_handler;

	struct lem1802* lem1802 = malloc(sizeof(struct lem1802));

	lem1802->vram = 0x8000;
	lem1802->fram = LEM1802_USE_DEFAULT;
	lem1802->pram = LEM1802_USE_DEFAULT;
	lem1802->border = 0x0;

	hardware->state = lem1802;
}

void lem1802_write_texture(HARDWARE hardware, DCPU dcpu, char* texture_data)
{
	if (hardware == NULL || dcpu == NULL || texture_data == NULL)
	{
		return;
	}

	LEM1802 lem1802 = (LEM1802)hardware->state;

	if (lem1802 == NULL)
	{
		return;
	}

	uint16_t* memory = dcpu_memory(dcpu);

	uint16_t* vram = &memory[lem1802->vram];
	uint16_t* fram = (lem1802->fram == LEM1802_USE_DEFAULT ? default_font : &memory[lem1802->fram]);
	uint16_t* pram = (lem1802->pram == LEM1802_USE_DEFAULT ? default_palette : &memory[lem1802->pram]);

	for (int j = 0; j < 96; j++)
	{
		int cell_y = j / 8;

		for (int i = 0; i < 128; i++)
		{
			int cell_x = i / 4;

			int cell_i = cell_y * 32 + cell_x;

			uint16_t cell = vram[cell_i];

			// Split the cell data into seperate components.
			// FFFFBBBBXCCCCCCC : F = foreground, B = background, C = character
			uint16_t char_f = cell >> 12;
			uint16_t char_b = (cell >> 8) & 0xF;
			uint16_t char_c = cell & 0x7F;

			// Look up foreground and background colors from the palette memory.
			uint16_t pal_f = pram[char_f];
			uint16_t pal_b = pram[char_b];

			// Split the condensed foreground color into RGBA components.
			// 0000RRRRGGGGBBBB
			uint8_t pal_f_r = (pal_f >> 8) * 16;
			uint8_t pal_f_g = ((pal_f >> 4) & 0xF) * 16;
			uint8_t pal_f_b = (pal_f & 0xF) * 16;
			uint8_t pal_f_a = 255;

			// Split the condensed background color into RGBA components.
			// 0000RRRRGGGGBBBB
			uint8_t pal_b_r = (pal_b >> 8) * 16;
			uint8_t pal_b_g = ((pal_b >> 4) & 0xF) * 16;
			uint8_t pal_b_b = (pal_b & 0xF) * 16;
			uint8_t pal_b_a = 255;

			// The first two columns of a font character are stored in the first word of font memory.
			// The last two columns of a font character are stored in the second word of font memory.
			int font_column = i % 4;
			int font_row = j % 8;

			if (font_column < 2)
			{
				uint16_t font = fram[char_c * 2];

				if (font_column == 0)
				{
					font = font >> 8;
				}

				font = (font >> font_row) & 0x1;

				if (font)
				{
					texture_data[(j * 128 + i) * 4 + 0] = pal_f_r;
					texture_data[(j * 128 + i) * 4 + 1] = pal_f_g;
					texture_data[(j * 128 + i) * 4 + 2] = pal_f_b;
					texture_data[(j * 128 + i) * 4 + 3] = pal_f_a;
				}
				else
				{
					texture_data[(j * 128 + i) * 4 + 0] = pal_b_r;
					texture_data[(j * 128 + i) * 4 + 1] = pal_b_g;
					texture_data[(j * 128 + i) * 4 + 2] = pal_b_b;
					texture_data[(j * 128 + i) * 4 + 3] = pal_b_a;
				}
			}
			else
			{
				uint16_t font = fram[char_c * 2 + 1];

				if (font_column == 2)
				{
					font = font >> 8;
				}

				font = (font >> font_row) & 0x1;

				if (font)
				{
					texture_data[(j * 128 + i) * 4 + 0] = pal_f_r;
					texture_data[(j * 128 + i) * 4 + 1] = pal_f_g;
					texture_data[(j * 128 + i) * 4 + 2] = pal_f_b;
					texture_data[(j * 128 + i) * 4 + 3] = pal_f_a;
				}
				else
				{
					texture_data[(j * 128 + i) * 4 + 0] = pal_b_r;
					texture_data[(j * 128 + i) * 4 + 1] = pal_b_g;
					texture_data[(j * 128 + i) * 4 + 2] = pal_b_b;
					texture_data[(j * 128 + i) * 4 + 3] = pal_b_a;
				}
			}
		}
	}
}
