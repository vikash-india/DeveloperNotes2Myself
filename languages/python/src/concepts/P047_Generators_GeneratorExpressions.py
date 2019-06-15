# Description: Example in Python

# Note
# 1. Simple generators can be easily created on the fly using generator expressions.
# 2. The syntax for generator expression is similar to that of a list comprehension in Python. But the square brackets
#    are replaced with round parentheses.
# 3. While list comprehension produces the entire list, generator expression produces one item at a time.

# A list of odd numbers
odds = [1, 3, 5, 7]

# A list comprehension to square each term
comprehension = [x ** 2 for x in odds]          # Output: [1, 9, 25, 49]
print(comprehension)

# A generator expression to square each term
generator = (x ** 2 for x in odds)              # Output: generator object <genexpr> at 0x7fa936396a40>
print(generator)

print()
print(next(generator))                          # Output: 1
print(next(generator))                          # Output: 9
print(next(generator))                          # Output: 25
print(next(generator))                          # Output: 49
#print(next(generator))                         # Output: StopIteration
