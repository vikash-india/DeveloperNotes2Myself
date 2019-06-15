# Description: Examples of Reduce Function

# Note
# The reduce function works as follows
# 1. At first step, first two elements of sequence are picked and the result is obtained.
# 2. Next step is to apply the same function to the previously attained result and the number just succeeding the second
#    element and the result is again stored.
# 3. This process continues till no more elements are left in the container.
# 4. The final returned result is returned.

import functools    # For reduce() function
import operator     # For operator() function

# List of numbers
numbers = [1, 3, 5, 6, 2]

# Compute sum of the list using reduce function
print("The sum of the list: ", end="")
print(functools.reduce(lambda a, b: a + b, numbers))

# Compute maximum element in the list using reduce function
print("The maximum element in the list: ", end="")
print(functools.reduce(lambda a, b: a if a > b else b, numbers))

# Compute sum of the list using reduce function and operator function
print("The sum of the list: ", end="")
print(functools.reduce(operator.add, numbers))

# Compute sum of the list using reduce function and operator function
print("The product of elements of the list: ", end="")
print(functools.reduce(operator.mul, numbers))

# Concatenate string using reduce function and operator function
print("The concatenated product is : ", end="")
print(functools.reduce(operator.add, ["geeks", "for", "geeks"]))
