# Description: Data Frames in R

# Note
# 1. Data frames are used to store tabular data in R. 
# 2. Hadley Wickham’s package dplyr has an optimized set of functions designed to work efficiently with data frames.
# 3. Data frames are represented as a special type of list where every element of the list has to have the same length. 
# 4. Each element of the list can be thought of as a column and the length of each element of the list is the number of
#    rows.
# 5. Unlike matrices, data frames can store different classes of objects in each column.
# 6. In addition to column names, indicating the names of the variables or predictors, data frames have a special
#    attribute called row.names which indicate information about each row of the data frame.
# 7. Data frames are usually created by reading in a dataset using the read.table() or read.csv().
# 8. Data frames can also be created explicitly with the data.frame() function or they can be coerced from other types
#    of objects like lists.
# 9. Data frames can be converted to a matrix by calling data.matrix(). While it might seem that the as.matrix()
#    function should be used to coerce a data frame to a matrix, almost always, what you want is the result of
#    data.matrix().

# Create a data frame
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
#   foo   bar
# 1   1  TRUE
# 2   2  TRUE
# 3   3 FALSE
# 4   4 FALSE

nrow(x)     # [1] 4
ncol(x)     # [1] 2

# TODO
# 1. None
