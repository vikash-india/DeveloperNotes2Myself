# Description: For Loop Construct in R

# Note
# 1. The for loops take an iterator variable and assign it successive values from a sequence or vector.
# 2. For loops are most commonly used for iterating over the elements of an object (list, vector, etc.)
# 3. The 'next' statement can be used to skip an iteration of a loop.
# 4. The 'break' statement can be used to exit a loop immediately.

# Example 1
for (i in 1 : 10) {
    print(i)
}

# Example 2
x <- c("a", "b", "c", "d")
for (i in 1 : 4) {
    # Do some operation on each element of x
    print(x[i])
}

# Example 3: Same as above
for (i in seq_along(x)) {
    print(x[i])
}

# Example 4: Same as above
for (letter in x) {
    print(letter)
}

# Example 5: Same as above
for (i in 1 : 4) print(x[i])

# Example 6: Nested loops
x <- matrix(1 : 6, 2, 3)
for (i in seq_len(nrow(x))) {
    for (j in seq_len(ncol(x))) {
        print(x[i, j])
    }
}

# Example 7: Use next statement to skip an iteration of a loop.
for (i in 1 : 10) {
    if (i <= 2) {
        # Skip the first 2 iterations
        next
    }
    print(i)
}

# TODO
# * None
