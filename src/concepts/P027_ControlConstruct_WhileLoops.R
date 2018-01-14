# Description: While Construct in R

# Note:
# 1. While loops begin by testing a condition. If it is true, then they execute the loop body. 
# 2. Once the loop body is executed, the condition is tested again, and so forth.
# 3. While loops can potentially result in infinite loops if not written properly.
# 4. While loops can have multiple conditions and they are evaluated from left to right.
# 5. The 'next' statement can be used to skip an iteration of a loop.
# 6. The 'break' statement can be used to exit a loop immediately.

# Example 1
count <- 0
while (count < 10) {
    print(count)
    count <- count + 1
}

# Example 2: While loop with more than 1 conditions which are evaluated from left to right
z <- 5
while (z >= 3 && z <= 10) {
    print(z)
    coin <- rbinom(1, 1, 0.5)
    if (coin == 1) { ## random walk
        z <- z + 1
    } else {
        z <- z - 1
    }
}

# TODO
# * None
