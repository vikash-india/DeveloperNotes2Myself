# Description: Generator for Pi Series

# Note
# 1. A simple generator function to generate Pi series.
# 2. Leibniz formula for π: https://en.wikipedia.org/wiki/Leibniz_formula_for_π
# 3. Value of Pi to 20 places of decimal is 3.14159265358979323846

# Generator of odd numbers
def odd_numbers():
    n = 1
    while True:
        yield n
        n += 2

# Generator for Pi series
def pi_series():
    odd = odd_numbers()
    approximation = 0
    while True:
        approximation += (4 / next(odd))
        yield approximation
        approximation -= (4 / next(odd))
        yield approximation

# Get generator object
approx_pi = pi_series()

# Get Pi Approximation
for x in range(10000000):
    print(next(approx_pi))
