/*
    Problem #: 3
    Author: Andrew Friedman
    Created: 07/03/2019
    Issue: var error with large numbers
*/

.global _start

_start:
    MOV r0, #2      // prime = 2
    LDR r1, =12345  // set input

    CMP r1, #2      // compare input and 2
    BLT done        // "no prime factors"

while:              // while (n != 1)
    CMP r1, #1
    BEQ done
    MOV r2, r1

mod:
    CMP r2, r0
    BLT while2
    SUB r2, r2, r0
    B mod

while2:
    MOV r3, #0
    CMP r2, #0      // check if prime is divisible
    BEQ div

forloop:            // find next prime number
    ADD r0, r0, #1
    CMP r1, r0      // I dont think this needs to exist
    BLT while       // cont.

prime:
    MOV r2, r0
    MOV r3, #1

for:                // check each divisor up to the square root
    ADD r3, r3, #2  // faster prime adder
    CMP r3, r2
    BGE while
    MOV r4, r2

mod2:
    CMP r4, r3
    BLT mod3
    SUB r4, r4, r3
    B mod2

mod3:
    CMP r4, #0
    BNE for         // number isnt prime
    B while         // number is prime

div:                // n = n / prime
    CMP r1, r0
    BLT div2
    ADD r3, r3, #1
    SUB r1, r1, r0
    B div

div2:
    MOV r1, r3
    B while

done:
    MOV r7, #1      // exit operation
    SWI 0           // cont.
