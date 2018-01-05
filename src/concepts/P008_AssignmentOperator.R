# Description: Assignment Operators in R

# Note
# - None

# Use <- symbol as the assignment operator.
# 1. The assignment operator (<-) can also used to point to the object receiving the value of the expression.
# 2. The assignment operator, <- can be thought of as a syntactic short-cut to the assign() function.
message <- "Hello World"
print(message)

# Using -> symbol as the assignment operator.
# 1. Assignments can also be made in the other direction.
"Hello World" -> message
print(message)

# Using assign() function for assignments.
assign("message", "Hello World")
print(message)

# Using the equal symbol (=) as the assignment operator.
# 1. In most contexts the ‘=’ operator can be also used as an assignment alternative.
# 2. Using = symbol for assignment operator in R is not the norm.
message = "Hello World"
print(message)

# TODO
# * None
