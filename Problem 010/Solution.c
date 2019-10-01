/*
Author: Milan Capoor
Problem: 010
Date: 2019.09.30
*/

//PROBLEM 010: Summation of Primes
/* The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
*/

#include <stdio.h>
int check_prime(int n) {
    if (n < 2 || n % 2 == 0) {
        return 0;
    } else {
        for (int i = 3; i*i <= n; i += 2) {
            if (n % i == 0) {
                return 0;
            }
        }
    }
    return 1;
}

long long int sum_primes(int n) {
    long long int sum = 2;
    for (int x = 3; x <= n; x += 2) {
        if (check_prime(x) == 1) {
            sum += x;
        }
    }
    return sum;
}

int main() {
    printf("%llu\n", sum_primes(2000000));
    return 0;
}
