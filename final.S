.global _start

_start:
    MOV r0, #0
    MOV r1, #0
loop:
    ADD r0, r0, #9
    ADD r1, r1, #1
    CMP r1, #1000
    BNE loop
done:
    MOV r4, r0
