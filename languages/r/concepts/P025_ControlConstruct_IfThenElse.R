# Description: If Construct in R

# Note
# 1. There can be 0, 1 or more else-if blocks.
# 2. The else part is optional and is executed when none of the condition matches.

# Example 1
rainfall = 30
if (rainfall == 0) {
    message = "No Rainfall!";
} else if (rainfall < 20) {
    message = "Light Rainfall!";
} else if (rainfall < 50) {
    message = "Medium Rainfall!";
} else {
    message = "Heavy Rainfall!";
}
print(message)

# Example 2
x = 5
if (x > 3) {
    y <- 10
} else {
    y <- 0
}
print(y)

# Example 3: Same as Example 2
y <- if (x > 3) {
    10
} else {
    0
}
print(y)

# TODO
# * None
