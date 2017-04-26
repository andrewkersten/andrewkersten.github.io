; Have the LEM1802 use a custom color palette
SET A, 0x0002
SET B, PALETTE
HWI 0x0000

; Set the clock to trigger 60 / B times per second
SET A, 0x0000
SET B, 0x0005
HWI 0x0001

; Set the clock to trigger interrupt on ticks
SET A, 0x0002
SET B, 0xBEEF
HWI 0x0001

IAS INTERRUPT_HANDLER

SET Z, 0x0000

HANG:
	SET PC, HANG

INTERRUPT_HANDLER:

SET I, 0x0000
SET X, 0x8028

SET Y, 0x00A0
MUL Y, Z
ADD Y, FRAME0

SET A, 0x0000
SET B, 0x0000

LOOP:
	SET [X], [Y]

	ADD X, 0x0001
	ADD Y, 0x0001
	ADD I, 0x0001
	ADD A, 0x0001

	IFN A, 0x0010
		SET PC, SKIP

	SET A, 0x0000
	ADD B, 0x0001

	SET C, B
	MUL C, 0x0020
	ADD C, 0x8028

	SET X, C

	SKIP:
	IFL I, 0x00A0
		SET PC, LOOP

	ADD Z, 0x0001
	IFE Z, 0x0004
		SET Z, 0x0000

	RFI A
	;SET PC, HANG

PALETTE:
	DAT 0x0999, 0x0041, 0x00B5, 0x00F7, 0x0000, 0x0851, 0x0F82, 0x0FC9, 0x0D93, 0x0FD6, 0x0FFF, 0x0307, 0x062F, 0x096F, 0x0000, 0x0000

FRAME0:
	DAT 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x011F, 0x011F, 0x131F, 0x131F, 0x131F, 0x191F, 0x131F, 0x011F, 0x001F, 0x001F, 0x001F
	DAT 0x001F, 0x001F, 0x001F, 0x011F, 0x121F, 0x331F, 0x321F, 0x221F, 0x241F, 0x841F, 0x941F, 0xA41F, 0x141F, 0x041F, 0x001F, 0x001F
	DAT 0x001F, 0x001F, 0x111F, 0x271F, 0x241F, 0x241F, 0x441F, 0x461F, 0x441F, 0x461F, 0x441F, 0x461F, 0x401F, 0x401F, 0x401F, 0x001F
	DAT 0x001F, 0x111F, 0x761F, 0x551F, 0x771F, 0x441F, 0x641F, 0x771F, 0x471F, 0x771F, 0x471F, 0x771F, 0x571F, 0x571F, 0x051F, 0x001F
	DAT 0x001F, 0x101F, 0x441F, 0x641F, 0x761F, 0x461F, 0x771F, 0x741F, 0x441F, 0x641F, 0x641F, 0x641F, 0x641F, 0x641F, 0x501F, 0x001F
	DAT 0x001F, 0x001F, 0x001F, 0x401F, 0x511F, 0x521F, 0x651F, 0x651F, 0x651F, 0x451F, 0x4B1F, 0x401F, 0x401F, 0x001F, 0x001F, 0x001F
	DAT 0x001F, 0x001F, 0x001F, 0x111F, 0x251F, 0x251F, 0x351F, 0xCC1F, 0xCA1F, 0xDA1F, 0xDD1F, 0xBA1F, 0x0B1F, 0x001F, 0x001F, 0x001F
	DAT 0x001F, 0x001F, 0x001F, 0x551F, 0xAA1F, 0xAA1F, 0xA51F, 0x5C1F, 0xAC1F, 0xAC1F, 0xDD1F, 0xAD1F, 0xBB1F, 0x001F, 0x001F, 0x001F
	DAT 0x001F, 0x001F, 0x001F, 0x501F, 0xA51F, 0xA51F, 0x551F, 0xC51F, 0xC41F, 0xB51F, 0xC41F, 0xB01F, 0x001F, 0x001F, 0x001F, 0x001F
	DAT 0x001F, 0x001F, 0x001F, 0x001F, 0x441F, 0x541F, 0x541F, 0x541F, 0x941F, 0x441F, 0x941F, 0x441F, 0x001F, 0x001F, 0x001F, 0x001F

FRAME1:
	DAT 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x011F, 0x011F, 0x131F, 0x131F, 0x131F, 0x191F, 0x131F, 0x011F, 0x001F, 0x001F, 0x001F
	DAT 0x001F, 0x001F, 0x001F, 0x011F, 0x121F, 0x331F, 0x321F, 0x221F, 0x241F, 0x841F, 0x941F, 0xA41F, 0x141F, 0x041F, 0x001F, 0x001F
	DAT 0x001F, 0x001F, 0x111F, 0x271F, 0x241F, 0x241F, 0x441F, 0x461F, 0x441F, 0x461F, 0x441F, 0x461F, 0x401F, 0x401F, 0x401F, 0x001F
	DAT 0x001F, 0x111F, 0x761F, 0x551F, 0x771F, 0x441F, 0x641F, 0x771F, 0x471F, 0x771F, 0x471F, 0x771F, 0x571F, 0x571F, 0x051F, 0x001F
	DAT 0x001F, 0x101F, 0x441F, 0x641F, 0x761F, 0x461F, 0x771F, 0x741F, 0x441F, 0x641F, 0x641F, 0x641F, 0x641F, 0x641F, 0x501F, 0x001F
	DAT 0x001F, 0x001F, 0x001F, 0x451F, 0x521F, 0x651F, 0x651F, 0x651F, 0x651F, 0x451F, 0x4B1F, 0x401F, 0x401F, 0x001F, 0x001F, 0x001F
	DAT 0x001F, 0x001F, 0x041F, 0x551F, 0x2A1F, 0x2A1F, 0x3A1F, 0x551F, 0xCA1F, 0xDA1F, 0xDD1F, 0xBA1F, 0x0B1F, 0x041F, 0x041F, 0x001F
	DAT 0x001F, 0x441F, 0x551F, 0x551F, 0xAA1F, 0xAA1F, 0x551F, 0xCC1F, 0xAC1F, 0xAC1F, 0xDD1F, 0xAB1F, 0x441F, 0x951F, 0x441F, 0x441F
	DAT 0x001F, 0x441F, 0x551F, 0xB91F, 0x541F, 0x501F, 0xCB1F, 0xCB1F, 0xCB1F, 0xCB1F, 0xB01F, 0x441F, 0x551F, 0x441F, 0x441F, 0x001F
	DAT 0x001F, 0x001F, 0x401F, 0x401F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x401F, 0x401F, 0x001F, 0x001F

FRAME2:
	DAT 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x011F, 0x011F, 0x131F, 0x131F, 0x131F, 0x191F, 0x131F, 0x011F, 0x001F, 0x001F, 0x001F
	DAT 0x001F, 0x001F, 0x001F, 0x011F, 0x121F, 0x331F, 0x321F, 0x221F, 0x241F, 0x841F, 0x941F, 0xA41F, 0x141F, 0x041F, 0x001F, 0x001F
	DAT 0x001F, 0x001F, 0x111F, 0x271F, 0x241F, 0x241F, 0x441F, 0x461F, 0x441F, 0x461F, 0x441F, 0x461F, 0x401F, 0x401F, 0x401F, 0x001F
	DAT 0x001F, 0x111F, 0x761F, 0x551F, 0x771F, 0x441F, 0x641F, 0x771F, 0x471F, 0x771F, 0x471F, 0x771F, 0x571F, 0x571F, 0x051F, 0x001F
	DAT 0x001F, 0x101F, 0x441F, 0x641F, 0x761F, 0x461F, 0x771F, 0x741F, 0x441F, 0x641F, 0x641F, 0x641F, 0x641F, 0x641F, 0x501F, 0x001F
	DAT 0x001F, 0x001F, 0x001F, 0x401F, 0x5B1F, 0x5C1F, 0x651F, 0x651F, 0x651F, 0x451F, 0x451F, 0x511F, 0x5A1F, 0x551F, 0x051F, 0x051F
	DAT 0x001F, 0x001F, 0x001F, 0xBB1F, 0xCC1F, 0xCC1F, 0x111F, 0x321F, 0x321F, 0x321F, 0x321F, 0x111F, 0xAA1F, 0xAA1F, 0xAA1F, 0x551F
	DAT 0x001F, 0x001F, 0x001F, 0xBB1F, 0xCC1F, 0xCC1F, 0xCC1F, 0x1C1F, 0x1C1F, 0x1C1F, 0x1D1F, 0x1D1F, 0x5B1F, 0x501F, 0x501F, 0x001F
	DAT 0x001F, 0x001F, 0x001F, 0x001F, 0xB41F, 0xC51F, 0xC51F, 0xC51F, 0xC41F, 0xB51F, 0xC41F, 0xB01F, 0x001F, 0x001F, 0x001F, 0x001F
	DAT 0x001F, 0x001F, 0x001F, 0x001F, 0x441F, 0x541F, 0x541F, 0x541F, 0x941F, 0x441F, 0x941F, 0x441F, 0x001F, 0x001F, 0x001F, 0x001F

FRAME3:
	DAT 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x011F, 0x011F, 0x131F, 0x131F, 0x131F, 0x191F, 0x131F, 0x011F, 0x001F, 0x001F, 0x001F
	DAT 0x001F, 0x001F, 0x001F, 0x011F, 0x121F, 0x331F, 0x321F, 0x221F, 0x241F, 0x841F, 0x941F, 0xA41F, 0x141F, 0x041F, 0x001F, 0x001F
	DAT 0x001F, 0x001F, 0x111F, 0x271F, 0x241F, 0x241F, 0x441F, 0x461F, 0x441F, 0x461F, 0x441F, 0x461F, 0x401F, 0x401F, 0x401F, 0x001F
	DAT 0x001F, 0x111F, 0x761F, 0x551F, 0x771F, 0x441F, 0x641F, 0x771F, 0x471F, 0x771F, 0x471F, 0x771F, 0x571F, 0x571F, 0x051F, 0x001F
	DAT 0x001F, 0x101F, 0x441F, 0x641F, 0x761F, 0x461F, 0x771F, 0x741F, 0x441F, 0x641F, 0x641F, 0x641F, 0x641F, 0x641F, 0x501F, 0x001F
	DAT 0x001F, 0x001F, 0x001F, 0x401F, 0x5B1F, 0x651F, 0x651F, 0x651F, 0x651F, 0x451F, 0x451F, 0x511F, 0x5A1F, 0x551F, 0x051F, 0x051F
	DAT 0x001F, 0x001F, 0x041F, 0xBB1F, 0xBC1F, 0xCC1F, 0x111F, 0x321F, 0x321F, 0x321F, 0x321F, 0x111F, 0xAA1F, 0xAA1F, 0xAA1F, 0x551F
	DAT 0x001F, 0x441F, 0x551F, 0xBB1F, 0xCC1F, 0xCC1F, 0xCC1F, 0x1C1F, 0x1C1F, 0x1C1F, 0x1D1F, 0x141F, 0x551F, 0x541F, 0x541F, 0x001F
	DAT 0x001F, 0x441F, 0x551F, 0x591F, 0xB41F, 0xB01F, 0xCB1F, 0xCB1F, 0xCB1F, 0xCB1F, 0xB01F, 0x441F, 0x551F, 0x441F, 0x441F, 0x001F
	DAT 0x001F, 0x001F, 0x401F, 0x401F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x401F, 0x401F, 0x001F, 0x001F
