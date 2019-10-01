/* 
Problem: 007
Author: Milan Capoor
Date: 8 June 2019
*/

//PROBLEM 7: 10001st Prime
/*  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
What is the 10 001st prime number? 
*/

#include <stdio.h>
#include <math.h>
#include <stdbool.h>

bool check_is_prime(int n) { //determine if the given number is prime
    if (n % 2 == 0) { //if it is divisble by two, it's not prime
        return false;
    }

    for (int i = 3; (i * i) <= n; i += 2) { //loop through odd numbers up to the sqrt
        if (n % i == 0) { //if it has a factor
            return false; 
        }
    }
    return true;
}

int main() {
    int target_index = 10001;  //the index of the prime you want to find (e.g. "the 10001st prime")
    int count = 1; //index of the prime
    int i = 2; //the first prime

    while (count != target_index) { //until you reach the 10001st prime
        i++; //increment the potential number
        if (check_is_prime(i) == true) { //check if it is prime
            count++; //increment the number of found primes
        }
    }

    printf("Prime number %d is: %d\n", count, i); //print the target prime
    return 0;
}
