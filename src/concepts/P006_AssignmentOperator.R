# Description: Assignment in R

# Note
# 1. The <- symbol is the assignment operator.
message <- "Hello World"
print(message)

#############################################################
# 1. Using assign() function
#    - Assignment can be made using the function assign()
assign("message", "Hello World")
print(message)

# 2. Using the assignment operator (<-)
#    - The assignment operator (<-) can also used to point to the object receiving the value of the expression.
#    - The assignment operator, <-, can be thought of as a syntactic short-cut to the assign() function.
message <- "Hello World"
print(message)

# 3. Using the assignment operator (->)
#    - Assignments can also be made in the other direction.
"Hello World" -> message
print(message)

# 4. Using the equal operator (=)
#    - In most contexts the ‘=’ operator can be used as an alternative.
message = "Hello World"
print(message)

# TODO
# 1. None
