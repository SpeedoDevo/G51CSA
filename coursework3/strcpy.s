	b main
src 	defb "asdfgh\n\0"
	align
main 	adr r2, src
	adr r3, dest
loop	ldrb r0, [r2], #1
	strb r0, [r3], #1
	cmp r0, #0
	bne loop
	adr r0, dest
	swi 3
	swi 2
	b main
dest 	defb 0