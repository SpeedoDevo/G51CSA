; Hello World Version 1

	B main

hello	DEFB	"Hello World\n\0"
		ALIGN

gbye	DEFB	"Goodbye Universe\0"
		ALIGN

main	ADR R0, hello	; printf("Hello World");
		SWI 3			; print the message
		ADR R0, gbye
		SWI 3
		SWI 2			; stop the program

