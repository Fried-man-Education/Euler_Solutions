/*
 * Author: Milan Capoor
 * Date: 2020.01.27
 * Problem: 20
 *
 *PROBLEM 20: Factorial Digit Sum
 Find the sum of the digits in the number 100!

!!!!!!!
NOTE: THIS SOLUTION REQUIRES THE GNU MULTIP PRECISION ARITHMETIC LIBRARY
!!!!!!!
*/

#include <stdio.h>
#include <gmp.h>

int main() {
	mpz_t product;
	mpz_init(product);

	mpz_fac_ui(product, 100);
	
	int length = mpz_sizeinbase(product, 10);
	char str[length];
	mpz_get_str(str, 10, product);

	int sum = 0;
	for (int i = 0; i < (length - 1); i++) {
		sum += str[i] - '0';
	}

	printf("%d\n", sum);
	
	return 0;

}
 
