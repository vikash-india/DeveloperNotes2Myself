# Description: Create a List of Squares Using Lambda Function

# Note
# 1. Combine lambda function with map function to create a list.

numbers = [1, 2, 3, 4, 5, 6]

# Code Without Using List Comprehension or Lambda Function
squares = []
for number in numbers:
    squares.append(number ** 2)

print(squares)

# List of Square Using List Comprehension
squares = [number ** 2 for number in numbers]
print(squares)

# Code Using Map Function and Lambda Function
squares = map(lambda x: x ** 2, numbers)
print(list(squares))
