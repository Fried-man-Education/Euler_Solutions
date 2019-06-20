# Problem 2 - Pedro Victor
# Python 3.7
# TODO

x = 0
n = 1
m = 2

while n <= 4000000:
    if n % 2 == 0:
        x += n
    n, m = m, n + m

print(x)
