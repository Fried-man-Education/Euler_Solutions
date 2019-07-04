# Problem 4 - Pedro Victor
# Python 3.7

palindrome = max(n * m
                 for n in range(100, 1000)
                 for m in range(100, 1000)
                 if str(n * m) == str(n * m)[:: -1])

print(palindrome)
