.global _start

_start:
    mov x1, #2000
    mov x2, #10

loop:
    cmp x1, x2
    blt done
    sub x1, x1, x2
    b loop

done:
    mov x3, #5
