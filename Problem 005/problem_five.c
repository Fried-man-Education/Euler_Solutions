/* 
Problem: 005
Author: Milan Capoor
Date: 8 June 2019
*/

//PROBLEM 5: Smallest Multiple
/* 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/

#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define _USE_MATH_DEFINES
#include <math.h>

long long int fact(int n) { //factorial function
    long long int result = sqrt(2 * M_PI * n) * pow((n / M_E), n); //uses Stirling's approximation (https://en.wikipedia.org/wiki/Stirling%27s_approximation)
    return result;
}

int main() {
    int target = 20; //highest factor 
    long long int max = fact(target); //n! is the upperbound for finding the smallest multiple
    int count; 
    int number;
    int factor;

    for (number = target; number < max; number++) { //potential smallest multiple
        count = 0;
        for (factor = 1; factor <= target; factor++) { //loops through all ints 1-20
            if (number % factor != 0) { //if it is missing a factor
                break; //move on
            } 
            count++; //if that number is a factor add to a count
        }
        if (count == target) { //if all numbers in the desired range are factors
            printf("Number: %d\n", number); //print out that number
            return 0;
        }
    }
}