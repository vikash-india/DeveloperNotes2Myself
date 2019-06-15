# Description: List Comprehensions Examples

vector = [-4, -2, 0, 2, 4]

# List with the values doubled
values = [x * 2 for x in vector]


# List with negative numbers excluded
values = [x for x in vector if x >= 0]

# Apply a function (that returns a value) for each element.
values = [abs(x) for x in vector]

# Apply a function that does not return value but modifies the argument for each element
fresh_fruit = ['  banana', '  loganberry ', 'passion fruit  ']
values = [fruit.strip() for fruit in fresh_fruit]

# List with expressions using complex numbers
from math import pi
values = [str(round(pi, i)) for i in range(1, 6)]

# Flatten a list using a list comprehension with two 'for'
vector = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
values = [num for element in vector for num in element]

# Create a list of 2-tuples like (number, square)
values = [(x, x ** 2) for x in range(6)]
# values = [x, x**2 for x in range(6)] # Error: The tuple must be parenthesized

# Combines the elements of two lists if they are not equal.
values = [(x, y) for x in [1, 2, 3] for y in [3, 1, 4] if x != y]

# Equivalent to the above example
# 1. Note that the order of the for and if statements is the same in both these snippets.
# 2. If the expression is a tuple (e.g. the (x, y) in the previous example), it must be parenthesized.
values = []
for x in [1, 2, 3]:
    for y in [3, 1, 4]:
        if x != y:
            values.append((x, y))

print(values)
