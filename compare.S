.global _start
_start:
    MOV X1, #300
    MOV x2, #50
    CMP x1, x2
    BGT else
if:
    MOV x3, #2
else:
    MOV x3, #5
