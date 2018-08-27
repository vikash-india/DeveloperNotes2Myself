# Description: Control Construct - for Loop in Python

myList = ["One", "Two", "Three"]

# Iterating a list
for item in myList:
    print(item, len(item))

# Iterating a range using range(start, end, step)
for item in range(5):
    print(item)

# The range(...) function
# 1. range(5) is 0, 1, 2, 3, 4. Upper boundary is not included.
# 2. Example of range function
#   - range(5, 10) is 5 through 9..
#   - range(0, 10, 3) is  0, 3, 6, 9.
#   - range(-10, -100, -30) is  -10, -40, -70.
# 3. The range is an object which returns the successive items of the desired sequence while iterating over it but it
#    doesn't really make the myList, thus saving space.
# 4. The for statement is one such iterator and myList() function is another iterator.
print(range(0,5,2))         # range(0, 5, 2)
print(list(range(5)))       # [0, 1, 2, 3, 4]

# Iterate over indices of a sequence
for i in range(len(myList)):
    print(i, myList[i])
