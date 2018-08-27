# Description: Repeat Construct in R

# Note
# 1. Repeat initiates an infinite loop. 
# 2. The only way to exit a repeat loop is to call break.
# 3. These are not commonly used in statistical applications but they do have their uses. 
# 4. Infinite loops should generally be avoided, even if they are theoretically correct.
# 5. The 'next' statement can be used to skip an iteration of a loop.
# 6. The 'break' statement can be used to exit a loop immediately.

sum <- 1
repeat {
    sum <- sum + 2;
    print(sum);
    if (sum > 11) {
        break;
    }
}

# TODO
# * None
