//PROBLEM 4: Largest Palindrome Product

/*A palindromic number reads the same both ways. The largest palindrome made from 
  the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/

#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int check_is_palindrome(int number) {
    int length = snprintf(NULL, 0, "%d", number); //gets length of number

    char *str = malloc(length + 1); //allocates memory for string (including terminating character)
    char *reverse = malloc(length + 1);
    
    snprintf(str, length + 1, "%d", number); //creates a string holding the number

    strcpy(reverse, str); //creates a variable to hold the reversed string 
    strrev(reverse); //reverses the string

    if (strcmp(reverse, str) == 0) { //if the reverse and original are the same
        return atoi(str); //return the value of the number as an int 
    }

    return 0; //if the number is not a palindrome, return 0
}

int main() {
    int number;
    int result;
    int max = 0;

    for (int i = 1000; i > 100; i--) { //one factor (limited between 100 and 1000)
        for (int j = 1000; j > 100; j--) { //the other factor
            number = i * j; //the product of the two three-digit numbers
            result = check_is_palindrome(number); //check if the product is a palindrome
            if (result != 0) { //if it is a palindrome
                if (result > max) { //and the number is higher than the previous highest recorded
                    max = result; //update max
                }
            }
        }
    }
    printf("The largest palindromic product of two three-digit numbers is: %d\n", max);
    return 0;
}