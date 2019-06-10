# Description: Variable Arguments in a Python Function


def functionWithFixedArguments(arg):
    print("Arguments to functionWithFixedArguments:", arg)
    print()


# 1. The *args is used to send a non-keyworded variable length argument list to the function.
# 2. When we have a formal parameter of the form *args, it receives a tuple containing the positional arguments after
#    the formal parameter list.
# 3. The *args can have zero or more formal parameters before it.
# 4. Any formal parameters which occur after the *args parameter are 'keyword-only' arguments.
def functionWithVariableArgumentsList(*argv):
    print("Arguments to functionWithVariableArgumentsList: ")
    for arg in argv:
        print("The arg in *argv:", arg)
    print


# 1. The **kwargs is used to pass keyworded variable length of arguments to a function.
# 2. The **kwargs is used to handle named arguments in a function.
# 3. When a final formal parameter is **kwargs, it receives a dictionary containing all keyword arguments except for the
#    formal parameters.
# 4. It may also have a formal parameter of the form *argv which receives a tuple containing the positional arguments
#    after the formal parameter list.
def functionWithNamedVariableArguments(**kwargs):
    print("Arguments to functionWithNamedVariableArguments: ")
    if kwargs is not None:
        for key, value in kwargs.items():
            print("The named argument %s in **kwargs: %s" % (key, value))
    print


# 1. Define a function as function_name(fargs,*args,**kwargs) to use all 3 in the same function
# 2. The *argv must occur before **kwargs.
def functionWithVariableArguments(arg1, arg2, namedArg1="One", namedArg2="Two", *argv, **kwargs):
    print("Arguments to functionWithVariableArguments: ")

    print("Fixed arguments:", arg1, arg2)
    print()

    print( "Named arguments:", namedArg1, namedArg2)
    print

    print("Non-Named Variable Arguments List")
    for arg in argv:
        print("The arg in *argv:", arg)
    print()

    print("Named Variable Arguments")
    if kwargs is not None:
        for key, value in kwargs.items():
            print("The named argument %s in **kwargs: %s" % (key, value))
    print()


# Call functions
functionWithFixedArguments(10)
functionWithVariableArgumentsList('A', 'B', 'C', 'D')
functionWithNamedVariableArguments(a=1, b=2, c=3, d=4)
functionWithVariableArguments(1, 2, "Three", "Four", 3, 4, 5, a=6, b=7, c=8, d=9)
