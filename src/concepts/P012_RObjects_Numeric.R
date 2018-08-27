# Description: Numeric Objects in R

# Numeric Objects
# 1. Numbers in R are generally treated as numeric objects (i.e. double precision real numbers). 
# 2. This means that even integer numbers like 1 or 2 is double precision real numbers in R ie something like 1.00 or 
#    2.00.
# 3. Use L suffix to specify integers explicity. So entering 1 in R gives a numeric object while entering 1L explicitly
#    gives an integer object.
# 4. There is also a special number Inf which represents infinity. This allows us to represent entities like 1 / 0. 
#    This way, Inf can be used in ordinary calculations. Eg. 1 / Inf is 0.
# 5. The value NaN represents an undefined value (Not a Number). Eg. 0 / 0 is NaN. NaN can also be thought of as a 
#    missing value.

# Create a numeric vector.
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
print(x)

# 6. A number occurring by itself in an expression is taken as a vector of length one.
x <- 1
print(x)

# TODO
# * None
