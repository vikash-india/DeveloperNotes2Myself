# Description: Lambda Forms

# Note
# 1. With the lambda keyword, small anonymous functions can be created.
# 2. Lambda forms can be used wherever function objects are required.
# 3. Lambda forms are syntactically restricted to a single expression.
# 4. Semantically, Lambda forms are just syntactic sugar for a normal function definition.
# 5. Like nested function definitions, lambda forms can reference variables from the containing scope.

# The following function returns the sum of its two arguments: lambda a, b: a+b.
def make_incrementor(n):
    return lambda x: x + n

# Calling lambada forms - Method 1
recursive_function = make_incrementor(10)
result = recursive_function(11)
print(result)

# Calling lambada forms - Method 2
result = make_incrementor(1)(2)
print(result)