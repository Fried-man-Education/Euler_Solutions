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

int sum_of_squares() { //square each term and find their sum
    int sum = 0;
    int product;
    for (int i = 0; i <= 100; i++){
        product = i * i; //square it
        sum += product; //sum them 
    }
    return sum;
}

int square_of_sum() { //sqaure the sum
    int sum = 0;
    for (int i = 0; i <= 100; i++) {
        sum += i; //sum them
    }
    sum *= sum; //square them
    return sum;
}

int main() {
    int result = square_of_sum() - sum_of_squares(); //find the difference
    printf("The difference in the sum of the squares of the natural numbers (1-100) and the square of the sum is: %d", result);
    return 0;
}