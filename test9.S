

    .section .text
    .global _start

_start:
    mov w0, #0          // Initialize sum to 0
    mov w1, #1          // Initialize counter to 1

loop1:
    add w0, w0, w1      // w0 = w0 + w1
    add w1, w1, #1      // w1 = w1 + 1
    cmp w1, #11         // Compare w1 with 11
    bne loop1           // If w1 != 11, branch to loop1

HERE:
    b HERE              // Infinite loop to prevent exit
