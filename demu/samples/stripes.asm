; NAME: bars
; DESCRIPTION: Displays vertical colored bars
; VERSION: 1.0
; AUTHOR: Andrew Kersten
; DCPU-16 VERSION: 1.7

SET I, 0x0000
SET J, 0x0000

DISPLAY_BARS:
	SET A, I
	MOD A, 0x0010
	SHL A, 0x000C ; Color bits offset
	BOR A, 0x001B ; Solid foreground character

	DISPLAY_BARS_INNER:
	SET B, J
	MUL B, 0x0020
	ADD B, I
	SET [0x8000 + B], A
	ADD J, 0x0001

	IFN J, 0x000C
		SET PC, DISPLAY_BARS_INNER

	SET J, 0x0000
	ADD I, 0x0001
	IFN I, 0x0020
		SET PC, DISPLAY_BARS

; Palette offset
SET Z, 0x0000

; Set the clock to trigger 60 / B times per second
SET A, 0x0000
SET B, 0x0006 ; 10 times per second
HWI 0x0001 ; hardcoded hardware index to match emulator, device discovery function needed

; Set the clock to trigger interrupt on ticks
SET A, 0x0002
SET B, 0xBEEF
HWI 0x0001 ; hardcoded hardware index to match emulator, device discovery function needed

IAS INTERRUPT_HANDLER

HANG:
	SET PC, HANG

INTERRUPT_HANDLER:

; Set the LEM1802 color palette
SET A, 0x0002
SET B, PALETTE
ADD B, Z
HWI 0x0000 ; hardcoded hardware index to match emulator, device discovery function needed

ADD Z, 0x0001
IFE Z, 0x000F
	SET Z, 0x0000

RFI A

PALETTE:
	DAT 0x0000, 0x000a, 0x00a0, 0x00aa, 0x0a00, 0x0a0a, 0x0a50, 0x0aaa, 0x0555, 0x055f, 0x05f5, 0x05ff, 0x0f55, 0x0f5f, 0x0ff5, 0x0fff
	DAT 0x0000, 0x000a, 0x00a0, 0x00aa, 0x0a00, 0x0a0a, 0x0a50, 0x0aaa, 0x0555, 0x055f, 0x05f5, 0x05ff, 0x0f55, 0x0f5f, 0x0ff5, 0x0fff
