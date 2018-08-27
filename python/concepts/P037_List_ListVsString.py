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

# Extended slice syntax to reverse a string.
# 1. Syntax is [begin:end:step]
# 2. By leaving begin and end off and specifying a step of -1, it reverses a string or a list
str_value = 'Hello'
print str_value[::-1]

list_values = ['One', 'Two', 'Three']
print list_values[::-1]
