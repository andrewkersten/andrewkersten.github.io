SET A, 0x0002
SET B, PALETTE
HWI 0x0000

; --------------------------------
; START STRIPES SAMPLE
; --------------------------------

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
	IFE I, 0x0020
		SET PC, HANG

	SET PC, DISPLAY_BARS

; --------------------------------
; END STRIPES SAMPLE
; --------------------------------

HANG:
	SET PC, HANG

PALETTE:
	DAT 0x0041, 0x00B5, 0x00F7, 0x0000, 0x0851, 0x0F82, 0x0FC9, 0x0D93, 0x0FD6, 0x0FFF, 0x0307, 0x062F, 0x096F, 0x0000, 0x0000, 0x0000
