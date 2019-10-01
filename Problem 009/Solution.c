/* 
Problem: 009
Author: Milan Capoor
Date: 3 July 2019
*/

//PROBLEM 9: Largest product in a series
/*  
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
*/

#include <stdio.h>
#include <math.h>

int main() {
    for (int a = 1; a < 333; a++) {
        for (int b = 1; b < 499; b++) { 
            if (sqrt((a * a) + (b * b)) - (int) sqrt((a * a) + (b * b )) == 0) {
               int c = sqrt((a * a) + (b * b));
               if (a + b + c == 1000 && (a < b && b < c)) {
                    printf("Triple: %d, %d, %d\n", a, b, c);
                    int product = a * b * c;
                    printf("Product: %d\n\n", product);
                    return 0;
                }
            } else {
                continue;
            }
        }
    }
}