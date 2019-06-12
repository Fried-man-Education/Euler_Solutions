/* 
Problem: 004
Author: Milan Capoor
Date: 8 June 2019
*/

//PROBLEM 6: Sum Square Difference
/*  The sum of the squares of the first ten natural numbers is,
      1^2 + 2^2 + ... + 10^2 = 385
    The square of the sum of the first ten natural numbers is,
      (1 + 2 + ... + 10)^2 = 552 = 3025
    Hence the difference between the sum of the squares of the first ten natural 
    numbers and the square of the sum is 3025 − 385 = 2640.
Find the difference between the sum of the squares of the first 
one hundred natural numbers and the square of the sum. 
*/

#include <stdio.h>

int sum_of_squares(int min_value, int max_number) { //square each term and find their sum
    int sum = 0;
    int product;
    for (int i = min_value; i <= max_number; i++){
        product = i * i; //square it
        sum += product; //sum them 
    }
    return sum;
}

int square_of_sum(int min_value, int max_number) { //square the sum of the terms
    int sum = 0;
    for (int i = min_value; i <= max_number; i++) {
        sum += i; //sum them
    }
    sum *= sum; //square them
    return sum;
}

int main() {
    int min = 0; //lowest value
    int max = 100; //highest value
    int result = square_of_sum(min, max) - sum_of_squares(min, max); //find the difference
    printf("The difference in the sum of the squares of the natural numbers (1-100) and the square of the sum is: %d", result);
    return 0;
}