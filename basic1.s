.global _start
_start:
	MOV R2,#0x5 @load R2 with 5 (R2 = 0x05)
	MOV R1,#0x2 @load R1 with 2 (R1 = 0x02)
	ADD R2, R1,R2 @R2 = R1 + R2
	ADD R2,R1,R2 @R2 = R1 + R2
	MOV R5,#0x20 @R5 = 0x20
	STRB R2,[R5] @store R2 into location pointed to by R5
