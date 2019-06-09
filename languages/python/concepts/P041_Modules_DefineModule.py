# Description: Modules in Python

# Defining a Module
# 1. A module can contain executable statements as well as function definitions.
# 2. The statements are intended to initialize the module. They are executed only when the first time the module is
#    imported somewhere.
# 3. Each module has its own private symbol table, which is used as the global symbol table by all functions defined in
#    the module.
# 4. Module's global variables with the same notation used to refer to its functions, modulename.itemname.
# 5. Modules can import other modules.

# Fibonacci numbers module
def fibonacci(n):
    """ Print the largest number less than n in a fibonacci series."""

    a, b = 0, 1
    while b < n:
        # print b
        a, b = b, a + b
    print(a)


def fibonacci2(n):
    """Return a list of fibonacci series up to n"""

    result = []
    a, b = 0, 1
    while b < n:
        result.append(b)
        a, b = b, a + b
    return result


# Note
# 1. Execute modules as scripts: python P041_Modules_CallModule.py.
# 2. The code 'if __name__ == "__main__":' makes the module executable as a script but it wont execute it if it's
#    imported by other module.
if __name__ == "__main__":
    fibonacci(10)
    print(fibonacci2(10))
