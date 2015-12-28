# Description: Else statement in Python Loops

# Loop statements may have an else clause
# Else in for loop: It is executed when the loop terminates through exhaustion of the list (with for) but not when the
# loop is terminated by a break statement.
for item in range(5):
    print(item)
    # break                            # Uncommenting this line will not execute the else part
else:
    print("Break was not called")

# Else in while loop: It is executed when the when the condition becomes false (with while) but not when the loop is
# terminated by a break statement.
i = 0
while i < 5:
    print(i)
    i = i + 1
    # break                           # Uncommenting this line will not execute the else part
else:
    print("Break was not called")
