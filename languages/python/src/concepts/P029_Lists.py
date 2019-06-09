# Description: Lists in Python

# List Creation
values = ['One', "Two", 300, 400]

# List Indexing
print(values[0])                    # One. Like string indices, list indices start at 0.
print(values[3])                    # 400. Item at index 3 i.e. 4th item in the list.
print(values[-2])                   # 300. Second item in the list from right/end.

# Slicing
# 1. All slicing operations return a new list containing the requested elements. In short, a shallow copy of the list
#    is returned
print(values[1:-1])                 # ['Two', 300]. Lists can be sliced just like strings.
print(values[:2])                   # ['One', 'Two']. From beginning to index 1.
print(3 * values[:3] + ['Five'])    # ['One', 'Two', 300, 'One', 'Two', 300, 'One', 'Two', 300, 'Five'].

# Slice Assignments
values[2] = values[2] + 1           # ['One', 'Two', 301, 400]. Unlike IMMUTABLE strings, individual elements of the list
                                    # can be modified or replaced.
values[0:2] = [100, 200]            # [100, 200, 301, 400]. Assignment to slices can even change the size of the list or
                                    # clear it entirely. Add some items.
values[0:2] = []                    # [301, 400]. Remove some items.
values[1:1] = ['AAA', 'BBB']        # [301, 'AAA', 'BBB', 400]. Insert some items.
values[:0] = values                 # [301, 'AAA', 'BBB', 400, 301, 'AAA', 'BBB', 400]. Insert a copy of itself at the
                                    # beginning of the list.
values[:] = []                      # Clear the list by replacing all items with an empty list.

# Methods on Lists
len(values)                         # 0. The built-in function len() also applies to lists.
values.append('extra')              # ['extra']. Add something to the end of the list.
print([1,2,3] + [4,5])              # Like string, list can be concatenated.
values = ['One', "Two"]

# Nesting of Lists
nested_list = [111, values, 222]    # [111, ['One', 'Two', 300], 222]. List within a list.
print(len(nested_list))             # 3. Length of outer list.
print(len(nested_list[1]))          # 2. Length of nested list.
print(nested_list[1])               # ['One', 'Two']. Content of inner list.
print(nested_list[1][0])            # One. 0th element of the inner list.
