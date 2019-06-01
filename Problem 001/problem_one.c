//PROBLEM 1: Multiples of 3 and 5
/*
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
*/

#include <stdio.h>

int return_sum() {
    int x;
    int sum;
    for (x = 0; x < 1000; x++) { //numbers less than 1000
        if (x % 3 == 0 || x % 5 == 0) { //if the number is evenly divisble by 3 or 5
            sum += x; //keep a running tally of the multiples
        }
    }
    return sum;
}

int main() {
    printf("The sum of all all the multiples of 3 or 5 below 1000 is: %d\n", return_sum());
    return 0;
}