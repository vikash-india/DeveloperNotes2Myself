# Description: List Methods

# List Creation
values = [1, 2, 3]

# List Methods
values.append(4)            # Add an item to the end of the list. Equivalent to list[len(list):] = [4]
values.extend([5, 6])       # Extend the list by appending all the items in the given list.
                            # Equivalent to list[len(list):] = [5, 6].
values.insert(3, 100)       # Insert an item at a given position. The first argument is the index of the element before
                            # which to insert. Similarly list.insert(0, "X") inserts at the front of the list, and
                            # list.insert(len(a), "X") is equivalent to list.append("X").
values.pop(0)               # Remove the item at the given position in the list, and return it.
                            # Specifying position is optional. If no index is specified, a.pop() removes and returns the
                            # last item in the list.
values.count("X")           # Return the number of times "X" appears in the list.
values.sort()               # Sort the items of the list, IN PLACE.
values.reverse()            # Reverse the elements of the list, IN PLACE.

# The 'in' Operator
# Note: The keyword in or not in can be used to check the presence or absence of an element before calling certain
# methods which gives error.
if "One" in values:
    print('Present!')
else:
    print('Not present!')

if "X" in values:
    values.index("X")       # Return the index in the list of the first item whose value is "X". It gives ERROR if there
                            # is no such item
if "X" in values:
    values.remove("X")      # Remove the FIRST item from the list whose value is "X". It gives ERROR if there is no
                            # such item.

len(values)                 # Not a list method. This returns the length of any sequence.
sum([1,2,3,4])              # 10. Sum of the values in list.

# Print the content
print(values)
