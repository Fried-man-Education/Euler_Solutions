/*
    Problem #: 001
    Author: Milan Capoor
    Created: 06/01/2019
*/

//PROBLEM 1: Multiples of three and five
/* 
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
*/
#include <stdio.h>

int return_sum(int div1, int div2, int max) { //calculates the sume of all the multiples of 'div1' or 'div2' up to 'max'
    int x;
    int sum;
    for (x = 0; x < max; x++) { //numbers less than the max
        if (x % div1 == 0 || x % div2 == 0) { //if the number is evenly divisble by either of the multiples
            sum += x; //keep a running tally of the multiples
        }
    }
    return sum;
}

int main() {
    int div1 = 3; //the first multiple
    int div2 = 5; //the second multiple
    int max = 1000; //the upper bound
    printf("The sum of all all the multiples of %d or %d below %d is: %d\n", div1, div2, max, return_sum(div1, div2, max));
    return 0;
}
