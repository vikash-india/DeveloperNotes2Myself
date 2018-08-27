# Description: Attributes of R Objects

# Note
# 1. R objects can have attributes, which are like metadata for the object. These metadata can be very useful in that
#    they help to describe the object. For example, column names on a data frame help to tell us what data are contained
#    in each of the columns. Some examples of R object attributes are as follows
#    - names, dimnames
#    - dimensions (e.g. matrices, arrays)
#    - class (e.g. integer, numeric)
#    - length
#    - other user-defined attributes/metadata
# 2. Attributes of an object (if any) can be accessed using the attributes() function. Not all R objects contain
#    attributes, in which case the attributes() function returns NULL.

# Attributes of matrices
m <- matrix(nrow = 2, ncol = 3)
attributes(m)
# $dim
# [1] 2 3

# Attributes of lists
x <- vector("list", length = 3)
attributes(x)
# NULL

# Attributes of factors
x <- factor(c("yes", "yes", "no", "yes", "no"))
attributes(x)   # NULL
# $levels
# [1] "no"  "yes"
#
# $class
# [1] "factor"

# TODO
# * None
