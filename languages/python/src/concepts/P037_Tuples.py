# Description: Tuples in Python

# Note
# 1. A tuple consists of a number of values separated by commas

# Create Tuples
empty_tuple = ()                                # Empty tuple
singleton_tuple = 'hello',                      # Note trailing comma
another_tuple = 1, 2, 'A', 'anyValue'           # Tuple with 4 elements

# Access Tuples
print(another_tuple[0])                         # Accessing element at 0th position
print(another_tuple)                            # Accessing all elements of a tuple

# Modify Tuples:
# 1. Tuples, like strings, are immutable.
# 2. Tuples, like strings, can be sliced and concatenated to form new tuple.
#singleton_tuple[0] = 'anotherString'           # Error
#print(singleton_tuple[0])
tuples_with_list = [1, 2, 3],                   # It is also possible to create tuples which contain mutable objects,
                                                # such as lists.
print(tuples_with_list)

# Nested Tuples
nested_tuple = another_tuple, (1, 2, 3, 4, 5)   # Tuples may be nested
print(nested_tuple)

# Tuple Packing and Unpaking
another_tuple = 1, 2, 'A'                       # Tuple packing or Sequence packing
x, y, z = another_tuple                         # Tuple UNpacking or Sequence UNpacking

# Tuple Functions
print(len(empty_tuple))                         # Number of elements in a tuple
