# Description: Break Statement in Python

# Break in for loop
for var in range(5):
    if var == 3:
        break           # The break statement, like in C, breaks out of the smallest enclosing for or while loop
    print(var)

# Break in While Loop
i = 0
while i < 5:
    if i == 3:
        break           # The break statement, like in C, breaks out of the smallest enclosing for or while loop
    print(i)
    i = i + 1
