    MOV     x0, #50          // Dividend
    MOV     x1, #3           // Divisor
    MOV     x2, #0           // Result
    MOV     x3, x0           // Remainder

loop:
    CMP     x3, x1           // Compare remainder with divisor
    BLT     done             // If remainder < divisor, division is done
    SUB     x3, x3, x1       // Subtract divisor from remainder
    ADD     x2, x2, #1       // Increment result
    B       loop             // Repeat

done:
