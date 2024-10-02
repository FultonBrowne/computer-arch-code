    .section .text
    .global _start

#define UART0_BASE 0x09000000
#define UART0_DR   (UART0_BASE + 0x00)
#define UART0_FR   (UART0_BASE + 0x18)

_start:
    // Load addresses
    ldr x0, =message      // x0 = address of message
    ldr x1, =UART0_DR     // x1 = address of UARTDR
    ldr x2, =UART0_FR     // x2 = address of UARTFR

print_loop:
    ldrb w3, [x0], #1     // Load byte into w3 and increment x0
    cbz w3, exit          // If byte is zero, exit loop

wait_tx_ready:
    ldr w4, [x2]          // Read UARTFR into w4
    and w4, w4, #0x20     // Mask to check TXFF bit
    cbnz w4, wait_tx_ready // If TXFF is set, wait

    strb w3, [x1]         // Write byte to UARTDR
    b print_loop          // Repeat loop

exit:
    b exit                // Infinite loop to prevent exiting

    .section .data
message:
    .asciz "Hello, World!\n"
