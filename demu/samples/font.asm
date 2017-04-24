; NAME: font
; DESCRIPTION: Copies all font characters into VRAM
; VERSION: 1.0
; AUTHOR: Andrew Kersten
; DCPU-16 VERSION: 1.7

SET Z, 0x7800
SET I, 0x0000

FONT_DUMP:
	SET A, I
	BOR A, Z

	SET [0x8000 + I], A

	ADD I, 0x0001
	IFN I, 0x0080
		SET PC, FONT_DUMP

HANG:
	SET PC, HANG
