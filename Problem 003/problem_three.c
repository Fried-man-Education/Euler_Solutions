/*
Problem: 003
Written by: Milan Capoor
Date: 6 June 2019
*/

//PROBLEM THREE: Largest Prime Factor

/*
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
*/

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

long long int check_primality(long long int number) { //determine if a given number is prime
    if (number % 2 == 0) {
        return 1;
    } else {
        for (long long int i = 2; i <= sqrt(number); i++) { //check each divisor up to the square root
            if (number % i == 0) { //if any number is a factor
            return 0; //return 0 (false)
            }   
        }
    }
    return 1; //if no numbers are factors return 1 (true)
}

int main() {
    long long int number = 600851475143;

    if (check_primality(number) == 1) {
        printf("The number is prime.\n");
    } else {
        for (long long int i = 2; i * i <= number; i++) { //test all ints up to the sqrt of the number
            if (number % i == 0) { //if 'i' is a factor 
                if (check_primality(i) == 1) { //check if i is prime
                    printf("%llu is a prime factor of %llu\n", i, number); //print the unique prime factors
                } 
            }
        }
    }
    return 0;
}
