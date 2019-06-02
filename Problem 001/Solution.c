/*
    Problem #: 001
    Author: Milan Capoor
    Created: 06/01/2019
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
