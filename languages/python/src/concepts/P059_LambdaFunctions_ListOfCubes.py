# Description: Create a List of Cubes Using Lambda Function

# Note
# 1. Lambdas function can be combined with map function to achieve list comprehension functionality.

numbers = (1, 2, 3, 4)

# List of cubes using map function but without using lambda function
def cube(x):
    return x * x * x

result = map(cube, numbers)                 # Use map function to find the cube of every element of the list.
print(list(result))                         # Convert return object of map to any iterable object like list, tuple etc.

# List of cubes using map function and lambda function
cubes = map(lambda x: x * x * x, numbers)   # Use map function and lambda function to find cubes of every element.
print(list(cubes))                          # Convert return object of map to any iterable object like list, tuple etc.
