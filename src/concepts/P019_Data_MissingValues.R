# Description: Missing Values in R

# Missing Values
# 1. When an element or value is “not available” or a “missing value” in the statistical sense, a place within a 
#    vector may be reserved for it by assigning it the special value NA. 
# 2. In general any operation on an NA becomes an NA.
# 3. The function is.na(x) gives a logical vector of the same size as x with value TRUE if and only if the
#    corresponding element in x is NA.
v <- c(1:3, NA)         # Same as a vector c(1, 2, 3, NA)
print(v)

result <- is.na(v)
print(result)

# 4. Notice that the logical expression x == NA is quite different from is.na(x) since NA is not really a value but a
#    marker for a quantity that is not available. Thus x == NA is a vector of the same length as x all of whose values
#    are NA as the logical expression itself is incomplete and hence undecidable.
result <- v == NA       # Will result in NA
print(result)

# 5. There is a second kind of “missing” values which are produced by numerical computation, the so-called Not a Number,
#    NaN, values. 
result <- 0/0           # Dividing 0/0 will result in NaN.
result <- Inf - Inf     # Inf and -Inf denotes Postive Infinity and Negative Infinity
print(result)

# 6. A NaN value is also NA but the converse is not true. Hence the is.na(xx) is TRUE both for NA and NaN values.
# 7. To differentiate between NA and NaN, use is.nan(xx) which is TRUE only for NaNs.
v <- c(1:3, NA, NaN)    # Same as a vector c(1, 2, 3, NA, NaN)
result <- is.na(v)      # [1] FALSE FALSE FALSE  TRUE  TRUE
result <- is.nan(v)     # [1] FALSE FALSE FALSE FALSE  TRUE
print(result)

# 8. Missing values are sometimes printed as <NA> when character vectors are printed without quotes.
# 9. NA values have a class also, so there are integer NA, character NA, etc.

# TODO
# 1. None
