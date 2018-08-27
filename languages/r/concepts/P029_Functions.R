# Description: Functions in R

# Note
# 1. Functions are created using the function() directive and are stored as R objects just like anything
#    else. In particular, they are R objects of class "function".
# 2. Functions in R are "first class objects", which means that they can be treated much like any other R
#    object.
# 3. Functions can be passed as arguments to other functions.
# 4. Functions can be nested, so that you can define a function inside of another function.
# 5. The return value of a function is the last expression in the function body to be evaluated. So the 
#    last expression evaulated is returned even if the 'return' keyword is not used.

# Defining a Function
f <- function() {
    print("Hello World")
}

# Calling a Function
f()         # Calls function
f           # Displays the function definition.
print(f)    # Same as above

# Function With Arguments
# 1. The default value for an argument can also be set to NULL.
# 2. The arguments b and c are function arguments with default values.
f <- function(a, b = 1, c = 2, d = NULL) {
    print(a)
    print(b)
    print(c)
    print(d)
}

# Calling a Function With Arguments
f(5, 6, 7, 8)           # Calling a function with all arguments.
f(5, 6)                 # Calling a function without using all arguments.
f(5, 6)                 # Calling a function using argument position.
f(a = 5, b = 6)         # Calling a function using argument name.
f(5, c = 6)             # Mix positional matching with matching by name.
f(b = 5, a = 6)         # Order does not matter if a function is called using argument name.

# Function With Return Values
# 1. Last evaluated expression is returned.
f <- function(num) {
    print("Hello World")

    # Return value
    x <- 5
}
a <- f()
print(a)                # 5

# Miscellaneous
class(f)                # [1] "function". Functions have their own class
formals(f)              # The formals() function returns a list of all the formal arguments of a function
args(f)                 # The args() function returns the argument list of a function.

# TODO
# * None
