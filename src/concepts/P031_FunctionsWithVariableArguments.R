# Description: Variable Arguments Functions in R

# The "..." Argument
# 1. The ... argument indicate a variable number of arguments that are usually passed on to other functions.
# 2. The ... is often used when extending another function and you don't want to copy the entire argument list of the
#    original function·
myplot <- function(x, y, type = "l", ...) {
    plot(x, y, type = type, ...)
}

# 3. Generic functions use ... so that extra arguments can be passed to methods (more on this later).
mean
# Output: 
# function (x, ...)
# UseMethod("mean")

# 4. The ... argument is also necessary when the number of arguments passed to the function cannot be known in advance.
args(paste)
# Output: function (..., sep = " ", collapse = NULL)

args(cat)
# Output: 
# function (..., file = "", sep = " ", fill = FALSE, labels = NULL, 
# append = FALSE)

# Arguments Coming After the "..." Argument
# One catch with ... is that any arguments that appear after ... on the argument list must be named explicitly and 
# cannot be partially matched.
args(paste)
# Output: function (..., sep = " ", collapse = NULL)

paste("a", "b", sep = ":")      # Output: [1] "a:b"
paste("a", "b", se = ":")       # Output: [1] "a b :"

# TODO
# * None
