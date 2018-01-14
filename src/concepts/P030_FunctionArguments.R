# Description: Function Arguments in R

# Function Arguments
# 1. Functions can have named arguments which can potentially have default values.
# 2. The formal arguments are the arguments included in the function definition.
# 3. The formals() function returns a list of all the formal arguments of a function.
# 4. Not every function call in R makes use of all the formal arguments.
# 5. Function arguments can be missing or might have default values.
#
# Argument Matching
# 1. R functions arguments can be matched positionally or by name.
# 2. Positional matching can be mixed with matching by name. When an argument is matched by name, it is "taken out" of
#    the argument list and the remaining unnamed arguments are matched in the order that they are listed in the
#    function definition. The following two calls are equivalent.
# 3. Most of the time, named arguments are useful on the command line when you have a long argument list and you want
#    to use the defaults for everything except for an argument near the end of the list.
# 4. Named arguments also help if you can remember the name of the argument and not its position on the argument list
#    (plotting is a good example).
# 5. Function arguments can also be partially matched, which is useful for interactive work.
# 6. The order of operations when given an argument is
#       - 1. Check for exact match for a named argument
#       - 2. Check for a partial match
#       - 3. Check for a positional match
myFunction <- function(x = rnorm(3), na.rm = FALSE) {
    print(x)
    print(na.rm)
}
mydata <- rnorm(5)
myFunction(mydata)
myFunction(x = mydata)
myFunction(x = mydata, na.rm = FALSE)
myFunction(na.rm = FALSE, x = mydata)
myFunction(na.rm = FALSE, mydata)

# The following calls to myFunction are all equivalent.
# Even though it's legal, but messing around with the order of the arguments too much is not recommended since it
#    can lead to some confusion.
lm(data = mydata, y ~ x, model = FALSE, 1 : 100)
lm(y ~ x, mydata, 1 : 100, model = FALSE)

# A function to get a list of arguments
args(lm)
# function (formula, data, subset, weights, na.action, method = "qr",
#          model = TRUE, x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE,
#          contrasts = NULL, offset, ...)

# Lazy Evaluation
# 1. Arguments to functions are evaluated lazily, so they are evaluated only as needed.
# 2. This function never actually uses the argument b, so calling f(2) will not produce an error because the 2 gets 
#    positionally matched to a.
# Example 1 of lazy evaluation
f <- function(a, b) {
    a ^ 2
}
f(2)

# Example 2 of lazy evaluation
# 1. Output will give error after printing a. This is because b did not have to be evaluated until after print(a).
# 2. Once the function tried to evaluate print(b) it had to throw an error. It will give the following output,
#       [1] 45
#       Error: argument "b" is missing, with no default
f <- function(a, b) {
    print(a)
    print(b)
}
f(45)

# TODO
# * None
