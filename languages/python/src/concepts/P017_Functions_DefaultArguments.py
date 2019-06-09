# Description: Functions With Default Argument Values

def functionWithDefaultArguments(number_1, string_1, number_2=3, string_2='Yes', list=[]):
    # Do something with the arguments!
    print(number_1, string_1, number_2, string_2, list)

# Calling the function with default values
functionWithDefaultArguments(1, "Test")
functionWithDefaultArguments(1, "Test", 5)
functionWithDefaultArguments(1, "Test", 5, "No")
functionWithDefaultArguments(1, "Test", 5, "No", [1, 2, 3, 4])

# IMPORTANT
# The default values are evaluated at the point of function definition in the defining scope. Hence arg will have value
# 5 and not 6
i = 5

def functionArgumentEvaluation(arg=i):  # i will have 5 and not 6
    print(arg)

i = 6
functionArgumentEvaluation()

# IMPORTANT
# The default value is evaluated only once. This makes a difference when the default is a mutable object such as a list,
# dictionary, or instances of most classes. For example, the following function accumulates the arguments passed to it
# on subsequent calls.
def functionAccumulatesValues(a, L=[]):
    L.append(a)
    return L

print(functionAccumulatesValues(1))
print(functionAccumulatesValues(2))
print(functionAccumulatesValues(3))

# IMPORTANT
# If you don't want the default to be shared between subsequent calls, you can write the function like this instead.
def functionWithoutAccumulatingValues(a, L=None):
    if L is None:
        L = []
    L.append(a)
    return L
