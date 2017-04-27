SET I, 0x0000

LOOP:
	SET A, [LOREM + I]

	IFE A, 0x0000
		SET PC, HANG

	BOR A, 0x0F00

	SET [0x8000 + I], A

	ADD I, 0x0001
	IFN I, 0x0180
		SET PC, LOOP

HANG:
	SET PC, HANG

LOREM:
	DAT "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 0x0000
