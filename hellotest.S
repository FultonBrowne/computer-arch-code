    .section .data

/* Data segment: define our message string and calculate its length. */
msg:
    .ascii "Hello, World\n"
len = . - msg

    .section .text

/* Our application's entry point. */
    .global _start
_start:
    /* syscall write(int fd, const void *buf, size_t count) */
    mov x0, #1          /* fd := STDOUT_FILENO */
    ldr x1, =msg        /* buf := msg */
    ldr x2, =len        /* count := len */
    mov x7, #4          /* write is syscall #4 */
    svc #0              /* invoke syscall */

    /* syscall exit(int status) */
    mov x0, #0          /* status := 0 */
    mov x7, #1          /* exit is syscall #1 */
    svc #0              /* invoke syscall */
