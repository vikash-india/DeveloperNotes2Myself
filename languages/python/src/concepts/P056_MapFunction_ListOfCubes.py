# Description: Create a List of Cubes Using Map Function

# Note
# 1. If a function is already define, use it over a list using a map function.

def cube(x):
    return x * x * x

# Use map to find cube of every element of the list.
numbers = (1, 2, 3, 4)
result = map(cube, numbers)

# Convert the return object of map to any iterable object like list, tuple etc.
print(list(result))
