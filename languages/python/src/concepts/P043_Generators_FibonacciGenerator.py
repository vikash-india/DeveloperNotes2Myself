# Description: Generator for Fibonacci Series

# Note
# 1. A simple generator function to generate fibonacci.
# 2. Use _ = input("Line XX") to understand the jump.

# Define a generator function
def fibonacci(n):
    a, b = 0, 1
    for _ in range(n):
        print("*", _)
        yield a
        a, b = b, a + b


# Get the generator object
fib = fibonacci(3)
print(fib)

# Get 1 value at a time using the generator object
print()
print(next(fib))
print(next(fib))
print(next(fib))

# Get all values at once using the generator object
print()
print(list(fibonacci(10)))
