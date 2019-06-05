//PROBLEM THREE: Largest Prime Factor
/*
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
*/

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int check_primality(number) { //determine if a given number is prime
    for (int i = 2; i < sqrt(number); i++) { //check each divisor up to the square root
        if (number % i == 0) { //if any number is a factor
           return 0; //return 0 (false)
        }   
    }
    return 1; //if no numbers are factors return 1 (true)
}

int main() {
    long long int number = 600851475143;

    for (int i = 2; i < sqrt(number); i++) { //test all ints up to the sqrt of the number
        if (number % i == 0) { //if 'i' is a factor 
            if (check_primality(i) == 1) { //check if i is prime
                printf("%d is a prime factor of 600851475143\n", i); //print the prime factors
            }
        }
    }
    return 0;
}
