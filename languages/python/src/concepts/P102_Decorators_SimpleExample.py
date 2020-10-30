# Description: A Simple Decorator Example


# Define a decorator
def a_decorator(function_as_parameter):

    # The inner_function is a wrapper function in which the arguments are called
    def inner_function():
        # The inner function can access the outer local functions and variables. Eg 'function_as_parameter'

        print("Before function execution!")

        # Calling the actual function now inside the wrapper function.
        function_as_parameter()

        print("After function execution!")

    return inner_function


# Define a function, to be decorated (ie called inside the wrapper function - inner_function)
def function_to_be_decorated_and_used():
    print("Inside the function!")


# Decorate the function, ie pass the 'function_to_be_decorated' inside the a_decorator to control its behavior.
# Store the function in the same variable name.
function_to_be_decorated_and_used = a_decorator(function_to_be_decorated_and_used)

# Call the function
function_to_be_decorated_and_used()
