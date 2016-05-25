# Description: Nested List Comprehensions

matrix = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
]

# Transpose a matrix using NESTED list comprehension
transpose = [[row[i] for row in matrix] for i in range(4)]

# Transpose a matrix WITHOUT using NESTED list comprehension
transpose = []
for i in range(4):
    transpose.append([row[i] for row in matrix])

# Transpose a matrix WITHOUT using list comprehension
transpose = []
for i in range(4):
    # Code to implement the nested list comprehension
    transposed_row = []
    for row in matrix:
        transposed_row.append(row[i])
    transpose.append(transposed_row)

# Transpose a matrix using a built-in function zip instead of a flow control statement.
transpose = zip(*matrix)

print(matrix)
print(transpose)
