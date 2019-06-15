# Description: Call Modules in Python

# Notes
# 1. It is customary but not required to place all import statements at the beginning of a module.
# 2. The Module Search Path: When a module is imported, the interpreter first searches for a built-in module with that
#    name. If a module is not found, it then searches for a file named modulename.py in a list of directories given by
#    the variable sys.path.
#       a. The directory containing the input script (or the current directory).
#       b. PYTHONPATH (a list of directory names, with the same syntax as the shell variable PATH).
#       c. The installation-dependent default.

# Variant 1: Import a module
import P041_Modules_DefineModule

# Variant 2: To import ONLY a set of functions from a module

# Variant 3: To import all functions from a module
# 1. In general the practice of importing * from a module or package is frowned upon, since it often causes poorly
# readable code


# Call methods from the imported module
P041_Modules_DefineModule.fibonacci(100)
print(P041_Modules_DefineModule.fibonacci2(100))

# The dir() function
# 1. The built-in function dir() is used to find out which names a module defines.
# 2. It lists all types of names: variables, modules, functions, etc.
# 3. Without arguments, dir() lists the names you have defined currently
print(dir())
print(dir(P041_Modules_DefineModule))
