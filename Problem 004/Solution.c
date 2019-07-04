/* 
Problem: 004
Author: Milan Capoor
Date: 7 June 2019
*/

//PROBLEM 4: Largest Palindrome Product

/*A palindromic number reads the same both ways. The largest palindrome made from 
  the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/

#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

int check_is_palindrome(long long int number) {
    long long int length = snprintf(NULL, 0, "%llu", number); //gets length of number

    char *str = malloc(length + 1); //allocates memory for string (including terminating character)
    char *reverse = malloc(length + 1);

    char* end_ptr; //necessary pointer for strtoul() function
    
    snprintf(str, length + 1, "%llu", number); //creates a string holding the number

    strcpy(reverse, str); //creates a variable to hold the reversed string 
    strrev(reverse); //reverses the string

    if (strcmp(reverse, str) == 0) { //if the reverse and original are the same
        return strtoul(str, &end_ptr, 10); //return the value of the number as an unsigned long int
    }

    return 0; //if the number is not a palindrome, return 0
}

long int* init_limits(int number_of_digits) { //given the desired number of digits, returns the highest and lowest possible factors
    if (number_of_digits < 1) {
        printf("Invalid number of digits");
        return 0;
    }
    long int* limits = malloc(2); //create a pointer to an array
    *limits = pow(10, number_of_digits - 1); //the minimum possible factor
    *(limits + 1) = pow(10, number_of_digits); //the maximum possible factor

    return limits;
}
int main() {
    int number_of_digits = 3; //input

    long int* limits = init_limits(number_of_digits); //uses the data from the init function
    int largest_factor = *(limits + 1);
    int smallest_factor = *limits;
    
    int highest_palindrome = 0;
    long int number;
    long int result;

    for (int i = largest_factor; i > smallest_factor; i--) { //one factor
        for (int j = largest_factor; j > smallest_factor; j--) { //the other factor
            number = i * j; //the product of the two numbers
            result = check_is_palindrome(number); //check if the product is a palindrome
            if (result != 0) { //if it is a palindrome
                if (result > highest_palindrome) { //and the number is higher than the previous highest recorded
                    highest_palindrome = result; //update max
                }
            }
        }
    }
    printf("The largest palindromic product of two %d-digit numbers is: %lu\n", number_of_digits, highest_palindrome);
    return 0;
}