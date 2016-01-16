# Description: Variable Arguments in a Python Function


def functionWithFixedArguments(arg):
    print "Arguments to functionWithFixedArguments:", arg
    print


# The *args is used to send a non-keyworded variable length argument list to the function.
def functionWithVariableArgumentsList(*argv):
    print "Arguments to functionWithVariableArgumentsList: "
    for arg in argv:
        print "The arg in *argv:", arg
    print


# 1. The **kwargs is used to pass keyworded variable length of arguments to a function.
# 2. The **kwargs is used to handle named arguments in a function.
def functionWithNamedVariableArguments(**kwargs):
    print "Arguments to functionWithNamedVariableArguments: "
    if kwargs is not None:
        for key, value in kwargs.iteritems():
            print "The named argument %s in **kwargs: %s" % (key, value)
    print


# Define a function as function_name(fargs,*args,**kwargs) to use all 3 in the same function
def functionWithVariableArguments(arg1, arg2, *argv, **kwargs):
    print "Arguments to functionWithVariableArguments: "

    print "Fixed arguments:", arg1, arg2
    print

    print "Non-Named Variable Arguments List"
    for arg in argv:
        print "The arg in *argv:", arg
    print

    print "Named Variable Arguments"
    if kwargs is not None:
        for key, value in kwargs.iteritems():
            print "The named argument %s in **kwargs: %s" % (key, value)
    print


# Call functions
functionWithFixedArguments(10)
functionWithVariableArgumentsList('A', 'B', 'C', 'D')
functionWithNamedVariableArguments(a=1, b=2, c=3, d=4)
functionWithVariableArguments(1, 2, 3, 4, 5, a=6, b=7, c=8, d=9)
