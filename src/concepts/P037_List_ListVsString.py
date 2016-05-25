# Description: List Vs String

# Note
# 1. String is immutable while list is mutable.
# 2. String is passed as Value to a function while list is passed as a reference.
# 3. List can be aliased but a copy a string is created when it is assigned to another string.
# 4. The * operator works in different ways for a list and a string. It multiplies the string but refers to the same
#    location if used with lists.

# String
print('Word' * 3)

# List
table = [[]] * 3
print(table)

table[1].append('Word')
print(table)