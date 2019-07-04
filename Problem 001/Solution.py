# Problem 1 - Pedro Victor
# Python 3.7
# TODO Find the sum of all the multiples of 3 and 5 under 1000

# For every number to 1000 check if number has a remainder that is zero
# If yes sum all the other numbers that have that remainder
sum_multiples_to_1000 = sum(x for x in range(1000) if x % 3 == 0 or x % 5 == 0)
print(sum_multiples_to_1000)
