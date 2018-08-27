# Description: The del Operator

# 1. The del operator removes an item from a list given its index instead of its value.
# 2. The del operator differs from the pop() method which returns a value.

values = [-1, 1, 66.25, 333, 333, 1234.5]

del values[0]       # Removes element at 0th position.
del values[2:4]     # Removes element from 2nd to 3rd position.
del values[:]       # Removes all the items.

print(values)

del values          # The del operator can also be used to delete entire variables.
#print(values)      # Referencing the name values is an error (at least until another value is assigned to it).
