# Description: Create Cube Function Using Lambda Function

# Note
# 1. Lambda functions can be combined with map to achieve list comprehension functionality.

# Function Without Using Lambda
def cube(x):
    return x * x * x

print(cube(5))

# Function Using Lambda Function
lambda_cube = lambda x: x * x * x

print(lambda_cube(7))
