.global _start
_start:
	MOV R2, #0x67
	MOV R8, #0x20
	STR R2, [R8]
