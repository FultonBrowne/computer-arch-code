    .global _start
_start:
    ldr x0, a
    ldr x1, b
    ldr x0, [x0]
    ldr x1, [x1]
    //mov x1, 0x1
    //mov x2, 0x0
    cmp x1, x2
    bgt greater
    b else
greater:
    mov x3, 0xFFFFFFFFFFFFFFFF
    b end
else:
    mov x3, 0x0
    b end
end:
    mov x8, 0x93
