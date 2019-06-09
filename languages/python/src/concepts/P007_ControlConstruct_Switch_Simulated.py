# Description: Switch Case (SIMULATED in Python)

# Note
# 1. There is NO switch statement in python.
# 2. A dictionary can be used to simulate switch case in python.
# 3. This style is also called loop-and-a-half.

def switch(argument):
    case = {
        'a': 1,
        'b': 2,
    }

    # The get() method of dictionary data type returns value of passed argument if it is present in dictionary
    # otherwise second argument will be assigned as default value of passed argument.
    return case.get(argument, "nothing")

print(switch('b'))
