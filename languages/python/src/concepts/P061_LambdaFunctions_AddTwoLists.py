# Description: Add Two Lists Using Lambda Function and Map Function

# Note
# 1. Combine lambda function and map function to work on lists.

# Two lists
numbers1 = [1, 2, 3]
numbers2 = [6, 5, 4]

# Add two lists using lambda function and map function
result = map(lambda x, y: x + y, numbers1, numbers2)
print(list(result))
