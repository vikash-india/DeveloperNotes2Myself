# Description: Names to Describe Data Objects

# Note
# 1. R objects can have names, which is very useful for writing readable code and self-describing objects.
# 2. Lists: Use names() function to set names for lists.
# 2. Matrices: Use colnames(), rownames() or dimnames() function to set names for matrices.
# 3. Data Frames: Use names() and row.names() to set names for data frames.

# Vectors
x <- 1 : 3
names(x)
names(x) <- c("A", "B", "C")

# Lists
x <- list("A" = 1, B = 2, C = 3)

# Matrices
# 1. It can have both column and row names.
m <- matrix(1 : 4, nrow = 2, ncol = 2)
colnames(m) <- c("H", "F") # Column names can be set separately using the colnames() function.
rownames(m) <- c("X", "Z") # Row names can be set separately using the rownames() function.
dimnames(m) <- list(c("A", "B"), c("C", "D")) # Set column and row names together using dimnames function.

print(m)
#   C D
# A 1 3
# B 2 4

# TODO
# * None