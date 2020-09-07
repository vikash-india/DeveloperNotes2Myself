# Description: Functions in Python

# Defining a function
# 1. The keyword def introduces a function definition, followed by a function name.
# 2. The body of the function MUST start at the next line, and MUST be indented.
# 3. The first statement of the function body can OPTIONALLY be a string literal to describe the function's
#     documentation string, or docstring.
# 4. All variable assignments inside a function store the value in the local symbol table.
# 5. Arguments are passed using call by value where the value is ALWAYS an object reference, and not the value of the
#    object.
# 6. Even functions without a return statement do return a value, "None".
def fibonacci(n):
    """Print a Fibonacci series up to n."""
    a, b = 0, 1
    while a < n:
        print (a, ' ')
        a, b = b, a + b
        print()

# Calling a functions:
# Example 1:
fibonacci(20)
print(fibonacci(20)) # Function returns None

# Example 2: All functions are first class data members. They can be assigned to other svariables.
recursive_function = fibonacci(20)   # Assigning the value returned by the function
print(recursive_function)            # Display the value of the variable.

# Example 3: All functions are first class data members. They can be assigned to other variables.
recursive_function = fibonacci       # Assigning a function.
print(recursive_function)            # Display the address of the function.
recursive_function(8)                # Calling the function by passing arguments.
