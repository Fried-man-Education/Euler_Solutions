# Problem 3 - Pedro Victor
# Python 3.7


def prime_factors(n):
    i = 2
    factors = []
    while i * i <= n:
        if n % i:
            i += 1
        else:
            n //= i
            factors.append(i)
    if n > 1:
        factors.append(n)
        # max() to print the largest number in the array
        print(max(factors))
    return factors


prime_factors(n=600851475143)
