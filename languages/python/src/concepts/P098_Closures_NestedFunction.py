# Description: Nested Functions

"""
### Nested Functions
* A function which is defined inside another function is known as nested function.
* Nested functions are able to access variables of the enclosing scope.
* In Python, these non-local variables can be accessed only within their scope and not outside their scope.

### Non-Local Variables
* Variable in outer function which are accessible inside inner functions are called non-local variables.
"""


# Nested functions
def outer_function(text):
    # Non-local variable
    text = text

    def inner_function():
        print(text)             # The inner_function() can easily be accessed inside the outer_function body but not
                                # outside of it's body. Hence, here, inner_function() is treated as nested Function
                                # which uses text as non-local variable.
    inner_function()


if __name__ == '__main__':
    outer_function('Hello World!')
