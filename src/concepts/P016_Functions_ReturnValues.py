# Description: Return Statement in Functions

# Return Statement
# 1. Even functions without a return statement return a value "None".
# 2. Multiple values can be returned by a Python function.
def fibonacci(n):
    """Return a list containing the Fibonacci series up to n."""
    result = []
    a, b = 0, 1
    while a < n:
        result.append(a)   # For returning to caller.
        a, b = b, a + b
    return result

# Call the function and collect its return value.
fibonacciList = fibonacci(6)
print(fibonacciList[:])
