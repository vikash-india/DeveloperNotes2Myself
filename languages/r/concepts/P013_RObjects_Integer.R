# Description: Integer Objects in R

# Integer Objects
# 1. Numbers in R are generally treated as numeric objects (i.e. double precision real numbers). 
# 2. This means that even integer numbers like 1 or 2 is double precision real numbers in R ie something like 1.00 or 
#    2.00.
# 3. Use L suffix to specify integers explicity. So entering 1 in R gives a numeric object while entering 1L explicitly
#    gives an integer object.

# Create an integer vector
x <- c(1L, 2L, 3L, 4L, 5L)
print(x)

# TODO
# * None
