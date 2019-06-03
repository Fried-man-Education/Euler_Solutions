/*
    Problem #: 2
    Author: Andrew Friedman
    Created: 06/02/2019
*/

.global _start

_start:
    MOV r0, #1         // n[1]
    MOV r1, #1         // n[2]
    LDR r3, =#0x3D0900 // 4 million > 8 bits

loop:
    CMP r1, r3
    BGE end            // might need to change to >
    ADD r2, r1, r0
    MOV r0, r1
    MOV r1, r2 
    TST r1, #1         // broken part of code
    BNE loop           // pt. 2
    ADD r4, r4, r1
    B loop

end:
    MOV r0, r4         // output value
    MOV r7, #1         // exit operation
    SWI 0              // pt. 2
