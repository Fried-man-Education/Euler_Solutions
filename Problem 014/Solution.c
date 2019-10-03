/*
Author: Milan Capoor
Problem: 014
Date: 2019.10.02
*/

//PROBLEM 012: Longest Collatz Sequence
/* 
n → n/2 (n is even)
n → 3n + 1 (n is odd)
Which starting number, under one million, produces the longest chain of applications of the Collatz Sequence?
*/

#include <stdio.h>
#include <math.h>
int collatz(int n) {
    if (n == 1) {
        return 1;
    } else {
        if (n % 2 == 0) {
            return (n / 2);
        } else {
            return ((3 * n) + 1);
        }
    }
}

int main() {
    int max_count = 0;
    int longest = 0;
    for (int i = 1; i < 1000000; i++) {
        int n = i;
        int count = 0;
        
        while (n != 1) {
            n = collatz(n);
            if ((int) log2(n) - log2(n) == 0) {
                count += log2(n);
                break;
            } else {
                count++;
            }
        }
        if (count > max_count) {
            max_count = count;
            longest = i;

        }
    }
    printf("%d", longest);
    return 0;
}