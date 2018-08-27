# Description: Switch Case (SIMULATED in Python)

# 1. There is NO switch statement in python
# 2. A dictionary can be used to simulate switch case in python
# 3. This style is also called loop-and-a-half
def switch(x):
    return {
        'a': 1,
        'b': 2,
        }.get(x, 9) # 9 is the default value

print switch('b')