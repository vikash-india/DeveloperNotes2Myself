# Description: Generator Expressions

# Note
# 1. Once the function yields, the function is paused and the control is transferred to the caller.
# 2. When the function terminates, StopIteration is raised automatically on further calls.
# 3. Local variables and their states are remembered between successive calls.
# 4. Generator function contains one or more yield statement instead of return statement.
# 5. Since methods like _next_() and _iter_() are implemented automatically, one can iterate through the items using
#    next().
# 6. Check the example below for the difference in the run time performance.

import sys

# An in-build generator function to generate numbers upto 10K
in_built_range = range(10000)

# A generator function to generate numbers upto 10K
def generator_function(n: int):
    start = 0
    while start < n:
        yield start
        start += 1

generator_range = generator_function(10000)

# A normal function to generate numbers upto 10K
def normal_function(n):
    my_list = []
    for value in range(n):
        my_list.append(value)

    return my_list

normal_range = normal_function(10000)

# Difference in Sizes
print(sys.getsizeof(range))
print(sys.getsizeof(generator_function))
print("Size of in_built_range: {} bytes".format(sys.getsizeof(in_built_range)))
print("Size of generator_range: {} bytes".format(sys.getsizeof(generator_range)))
print("Size of normal_range: {} bytes".format(sys.getsizeof(normal_range)))

# Difference in Return Values
print()
print("Return Value of in_built_range:", in_built_range)
print("Return Value of generator_range:", generator_range)
print("Return Value of normal_range:", normal_range)
