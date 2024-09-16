.global _start
_start:
	MOV R2, #0x9c
	MOV R3, #0xffffff64
	ADD R1, R2, R3
B _start  @ Unconditional branch to the label '_start', causing an infinite loop
