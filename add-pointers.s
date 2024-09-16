.global _start
_start:
	MOV R1, #0x99
	MOV R6, #0x92
	STRB R1,[R6]

	ADD R6, R6, #1
	MOV R1, #0x85
	STRB R1, [R6]

	ADD R6, R6, #1
	MOV R1, #0x3F
	STRB R1, [R6]

	ADD R6, R6, #1
	MOV R1, #0x63
	STRB R1, [R6]

	ADD R6, R6, #1
	MOV R1, #0x12
	STRB R1, [R6]
