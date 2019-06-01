/*
    Problem #: 1
    Author: Andrew Friedman
    Created: 06/01/2019
*/

.global _start     // required

_start:
    MOV r0, #0     // var r0 = 0
    MOV r1, #1000  // var r1 = 1000

loop:
    ADD r0, r0, #1 // r0++
    CMP r0, r1     // compare r0 and r1
    BEQ done       // if (r0 == r1) goto done
    MOV r2, r0     // var r2 = r0
    MOV r3, #3     // var r3 = 3
    MOV r4, #0     // var r4 = 0
    CMP r0, r3     // compare r0 and 3
    BLT loop       // if (r0 < 3) goto loop

int_div:
    CMP r2, r3     // compare r2 and r3
    BLT loop2      // if (r2 < r3) goto loop2
    ADD r4, r4, #1 // r4++
    SUB r2, r2, r3 // r2 -= r3
    B int_div      // goto int_div

loop2:
    CMP r2, #0     // compare r2 and 0
    BEQ add        // if (r2 == 0) goto add
    CMP r0, #5     // compare r0 and 5
    BLT loop       // if (r0 < 5) goto loop
    CMP r3, #5     // compare r3 and 5
    BEQ loop       // if (r3 = 5) goto loop
    MOV r2, r0     // r2 = r0
    MOV r3, #5     // r3 = 5
    MOV r4, #0     // r4 = 0
    B int_div      // goto loop

add:
    ADD r5, r5, r0 // r5 += r0
    B loop         // goto loop

done:
    MOV r0, r5     // output value
    MOV r7, #1     // required
    SWI 0          // required
