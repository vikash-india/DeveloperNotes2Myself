# Description: Create a List of Squares Using List Comprehension

numbers = [1, 2, 3, 4, 5, 6]

# List of Squares Without Using List Comprehension
squares = []
for number in numbers:
    squares.append(number ** 2)

print(squares)

# List of Square Using List Comprehension
squares = [number ** 2 for number in numbers]
print(squares)

# List of Square Using List Comprehension
squares = [number ** 2 for number in range(1, 7)]
print(squares)
