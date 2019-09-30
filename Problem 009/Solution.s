/*
    Problem #: 009
    Author: Andrew Friedman
    Created: 09/30/2019
*/

.global _start

_start:
    // r0 is a
    // r1 is b
    // r2 is c (at the end)
    B loopb

loopa:
    ADD r0, r0, #1  // a++
    MOV r1, #0

loopb:
    CMP r0, r1 
    BGE endloopb    // a >= b goto endloopb
    MUL r3, r0, r0  // r3 is r0^2
    MUL r4, r1, r1  // r4 is r1^2
    ADD r3, r3, r4  // r3 is c^2
    MOV r4, #0

findc:              // find square
    CMP r3, r4
    BEQ endloopb    // i == c^2 goto endloopb
    MUL r5, r4, r4  // i^2
    CMP r5, r3
    BEQ checksum    // found square root
    ADD r4, #1      // i++
    B findc

checksum:
    MOV r2, r4
    CMP r1, r2
    BGE endloopb    // b >= c goto endloop
    ADD r4, r0, r1  // a + b
    ADD r4, r4, r2  // (a + b) + c
    CMP r4, #1000
    BEQ getanswer   // a + b + c = 1000 goto getanswer

endloopb:
    ADD r1, r1, #1  // b++
    CMP r1, #500
    BLT loopb       // b < 500 goto loopb
    CMP r0, #500
    BLT loopa       // a < 500 goto loopa
    B done

getanswer:
    MUL r4, r0, r1
    MUL r3, r4, r2  // final answer for problem

done:
    MOV r4, #0      // cleanup
    MOV r5, #0      // cleanup
    MOV r7, #1      // required
    SWI 0           // required
