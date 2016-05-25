# Description: List Comprehensions

# Note
# 1. List comprehensions provide a concise way to create lists.
# 2. A list comprehension consists of brackets containing an expression followed by a for clause, then zero or more for
#    or if clauses.

# Method 1: Create a list
squares = []
for x in range(10):
    squares.append(x ** 2)
print (squares)

# Method 2: Use Lambda to create a list
squares = map(lambda x: x ** 2, range(10))
print (squares)

# Method 3: Use List Comprehension to create a list.
# Equivalent to above methods but it's more concise and readable
squares = [x ** 2 for x in range(10)]
print (squares)
