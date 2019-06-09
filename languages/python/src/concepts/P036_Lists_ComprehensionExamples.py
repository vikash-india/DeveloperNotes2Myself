# Description: List Comprehensions Examples

vector = [-4, -2, 0, 2, 4]

# Example 1: Create a new list with the values doubled.
values = [x * 2 for x in vector]
print("Values: %s" % values)

# Example 2: Filter the list to exclude negative numbers.
values = [x for x in vector if x >= 0]
print("Exclude Negatives: %s", values)

# Example 3: Apply a function (that returns a value) to each element.
values = [abs(x) for x in vector]
print("Apply a function: %s" % values)

# Example 4: Call a method that does not return value but modifies the argument on each element.
fresh_fruit = ['  banana', '  loganberry ', 'passion fruit  ']
values = [fruit.strip() for fruit in fresh_fruit]
print("Apply a method: %s" % values)

# Example 5: Can contain complex expressions.
from math import pi

values = [str(round(pi, i)) for i in range(1, 6)]
print("Complex Expression: %s" % values)

# Example 6: Flatten a list using a list comprehension with two 'for'.
vector = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
values = [num for element in vector for num in element]
print("Flatten a list: %s" % values)

# Example 7: Create a list of 2-tuples like (number, square).
values = [(x, x ** 2) for x in range(6)]
print("2-tuples list: %s" % values)
# Error: The tuple must be parenthesized, otherwise an error is raised.
# values = [x, x**2 for x in range(6)]

# Example 8: Combines the elements of two lists if they are not equal.
values = [(x, y) for x in [1, 2, 3] for y in [3, 1, 4] if x != y]
print("Create Pair: %s" % values)

# Equivalent to example 8
# 1. Note that the order of the for and if statements is the same in both these snippets.
# 2. If the expression is a tuple (e.g. the (x, y) in the previous example), it must be parenthesized.
values = []
for x in [1, 2, 3]:
    for y in [3, 1, 4]:
        if x != y:
            values.append((x, y))
print('Same as create pair: %s' % values)
