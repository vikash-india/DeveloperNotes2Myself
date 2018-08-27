# Description: Lists in R

# Note
# 1. Lists are a special type of vector that can contain elements of different classes. 
# 2. Lists can be explicitly created using the list() function.
x <- list(1, "a", TRUE, 1 + 4i)
print(x)
# [[1]]
# [1] 1
#
# [[2]]
# [1] "a"
#
# [[3]]
# [1] TRUE
#
# [[4]]
# [1] 1+4i

# 3. Create an empty list of a prespecified length with the vector() function
x <- vector("list", length = 3)
# [[1]]
# NULL
#
# [[2]]
# NULL
#
# [[3]]
# NULL

# TODO
# * None
