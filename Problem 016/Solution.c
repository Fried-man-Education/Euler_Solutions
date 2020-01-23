/*
 * Author: Milan Capoor
 * Date: 2020.01.20
 * Problem: 16
 *
 * PROBLEM 16: Power Digit Sum
 * What is the sum of the digits of the number 2^1000?
 *
 * !!!!!
 * NOTE: BECAUSE OF THE WAY C HANDLES TYPES, THIS SOLUTION REQUIRES THE "GNU MULTIPLE PRECISION ARITHMETIC LIBRARY" OR "GMP"
 * !!!!!
 */

#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include <gmp.h>

int main() {
	mpz_t prod;
	mpz_init(prod);

	mpz_ui_pow_ui(prod, 2, 1000); //stores 2^1000 in the arbitrarily-sized 'prod'

	const int length = mpz_sizeinbase(prod, 10) - 1; 
	char str[length];
	mpz_get_str(str, 10, prod);
	

	int sum = 0;
	for (int i = 0; i <= length; i++) {
		sum += str[i] - '0';
	}

	printf("%d\n", sum);
	return 0;
}

