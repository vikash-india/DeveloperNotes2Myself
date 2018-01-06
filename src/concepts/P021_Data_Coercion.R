# Description: Coercion in R

# Note
# 1. Sometime there is a need to mixing objects of two different classes in a vector but the vector rule says that a
#    vector cannot have different classes of objects. When different objects are mixed in a vector, IMPLICIT coercion
#    occurs so that every element in the vector is of the same class.
#    IMPLICIT coercion sometimes does exactly what you want and sometimes not. For example, combining a numeric object
#    with a character object will create a character vector, because numbers can usually be easily represented as
#    strings.
y <- c(1.7, "a")        # character
y <- c(TRUE, 2)         # numeric
y <- c("a", TRUE)       # character

# 2. Objects can also be explicitly coerced from one class to another using the as.* functions, if available.
x <- 0:6
class(x)                # [1] "integer"
as.numeric(x)           # [1] 0 1 2 3 4 5 6
as.logical(x)           # [1] FALSE TRUE TRUE TRUE TRUE TRUE TRUE
as.character(x)         # [1] "0" "1" "2" "3" "4" "5" "6"

# 3. Sometimes, R can't figure out how to coerce an object and this can result in NAs being produced. When nonsensical
#    coercion takes place, you will usually get a warning from R.
x <- c("a", "b", "c")
as.numeric(x)           # Warning: NAs introduced by coercion. [1] NA NA NA
as.logical(x)           # [1] NA NA NA
as.complex(x)           # Warning: NAs introduced by coercion. [1] NA NA NA

# TODO
# * None
