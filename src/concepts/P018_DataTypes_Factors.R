# Description: Factors in R

# Note
# 1. Factors are used to represent categorical data and can be unordered or ordered. 
# 2. Think of a factor as an integer vector where each integer has a label.
# 3. Factors are important in statistical modeling and are treated specially by modelling functions like lm() and glm().
# 4. Using factors with labels is better than using integers because factors are self-describing. 

# Create factor objects using the factor() function.
x <- factor(c("yes", "yes", "no", "yes", "no"))

x
# [1] yes yes no  yes no
# Levels: no yes

table(x)
# x
#  no yes
#  2   3

unclass(x) # See the underlying representation of factor
# [1] 2 2 1 2 1
# attr(,"levels")
# [1] "no"  "yes"

# 5. Often factors will be automatically created for you when you read a dataset in using a function like read.table().
#    Those functions often default to creating factors when they encounter data that look like characters or strings.
# 6. The order of the levels of a factor can be set using the levels argument to factor(). This can be important in
#    linear modelling because the first level is used as the baseline level.
x <- factor(c("yes", "yes", "no", "yes", "no"))
x       # Levels are put in alphabetical order.

x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
x       # Levels are put in order mentioned in levels function.

# TODO
# * None
