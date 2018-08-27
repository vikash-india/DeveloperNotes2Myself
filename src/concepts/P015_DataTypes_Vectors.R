# Description: Vectors in R

# Note
# 1. R operates on named data structures.
# 2. The simplest data structure is a vector, which is a single entity consisting of an ordered collection of R objects.
# 3. A vector can only contain objects of the same class.
# 4. The c() function can be used to create vectors of objects by concatenating things together. It takes an arbitrary
#    number of vector arguments and returns a value is a vector got by concatenating its arguments end to end.
x <- c(TRUE, FALSE)     ## Logical
x <- c(T, F)            ## Logical. T & F are short-hand ways to specify TRUE and FALSE.
x <- c("a", "b", "c")   ## Character
x <- c(0.5, 0.6)        ## Numeric
x <- 9 : 29             ## Integer
x <- c(1 + 0i, 2 + 4i)  ## Complex

# 5. One can also use the vector() function to initialize vectors.
x <- vector("numeric", length = 10) # Every item is initialized to 0.

# 6. Vectors can be used in arithmetic expressions, in which case the operations are performed element by element.
x <- c(1, 2, 3, 4, 5)
v <- 2 * x + 1
print(v)

# 7. Vectors occurring in the same expression need not all be of the same length. If they are not, the value of the
#    expression is a vector with the same length as the longest vector which occurs in the expression. Shorter 
#    vectors in the expression are recycled as often as need be (perhaps fractionally) until they match the length
#    of the longest vector. In particular a constant is simply repeated. So with the above assignments the command
x <- c(1, 2, 3, 4, 5, 6)
y <- c(10, 20)
v <- 2 * x + y + 1
print(v)                # [1] 13 25 17 29 21 33

# 8. A warning is generated if the longer object length is not a multiple of shorter object length.
x <- c(1, 2, 3, 4, 5)
y <- c(10, 20)
v <- 2 * x + y + 1
print(v)                # [1] 13 25 17 29 21

# TODO
# * None
