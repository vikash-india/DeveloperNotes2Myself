# Description: Using Functions Annotations

# 1. Function annotations are completely optional, arbitrary metadata information about user-defined functions.
# 2. Annotations are stored in the __annotations__ attribute of the function as a dictionary and have no effect on any
#    other part of the function.
# 3. Parameter annotations are defined by a colon after the parameter name, followed by an expression evaluating to the
#    value of the annotation.
# 4. Return annotations are defined by a literal ->, followed by an expression, between the parameter list and the colon
#    denoting the end of the def statement.

# This code will work in Python 3 and will give error in Python 2.7
def functionWithAnnotations(a: '42', b: int=23) -> list:
    print ("Annotations:", functionWithAnnotations.__annotations__)
    print ("Arguments:", a, b)

    return [1,2,3]

# Calling the function
print (functionWithAnnotations(1, 23))
