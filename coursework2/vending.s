;vendingmachine;

	B main

pmesg	defb "\nCSA vending machine\nPress 1 for Coke\nPress 2 for diet Coke\nPress 3 for Evian\n\nPress 0 to exit\n\0"
	align
coke 	defb "\nHave a Coke\n\0"
	align
diet	defb "\nHave a Diet Coke\n\0"
	align
evian	defb "\nHave an Evian\n\0"
	align
wrong	defb "\nWrong button\n\0"
	align
exitmsg	defb "\nHave a nice day\n\0"
	align


main	adr r0, pmesg
	swi 3
	swi 1
	cmp r0, #49
	beq pcoke
	cmp r0, #50
	beq pdiet
	cmp r0, #51
	beq pevian
	cmp r0, #48
	beq exit
	b pwrong
pcoke	adr r0, coke
	swi 3
	b main
pdiet	adr r0, diet
	swi 3
	b main
pevian	adr r0, evian
	swi 3
	b main
pwrong	adr r0, wrong
	swi 3
	b main
exit	adr r0, exitmsg
	swi 3
	swi 2