# Description: Matrices in R

# Note
# 1. Matrices are vectors with a dimension attribute. 
# 2. The dimension attribute is itself an integer vector of length 2 (number of rows, number of columns).
m <- matrix(nrow = 2, ncol = 3)
print(m)
dim(m)          # [1] 2 3

attributes(m)
# $dim
# [1] 2 3

# 3. Matrices are constructed column-wise, so entries can be thought of starting in the 'upper left' corner and running
#    down the columns.
m <- matrix(1:6, nrow = 2, ncol = 3)

# 4. Matrices can also be created directly from vectors by adding a dimension attribute.
m <- 1:10
dim(m) <- c(2, 5)
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    3    5    7    9
# [2,]    2    4    6    8   10

# 5. Matrices can be created by column-binding or row-binding with the cbind() and rbind() functions.
x <- 1:3
y <- 10:12

cbind(x, y)
# [1,] 1 10
# [2,] 2 11
# [3,] 3 12

rbind(x, y)
#   [,1] [,2] [,3]
# x   1    2    3
# y  10   11   12

# TODO
# 1. None
