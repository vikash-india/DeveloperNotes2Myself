# Description: Continue Statement in Python

# Continue statement in for loop
for var in range(5):
    if var == 3:
        continue        # The continue statement, like in C, continues with the next iteration of the loop.
    print(var)

# Continue statement in while loop
i = 0
while i < 5:
    if i == 3:
        continue        # The continue statement, like in C, continues with the next iteration of the loop.
    print(i)
    i = i + 1
