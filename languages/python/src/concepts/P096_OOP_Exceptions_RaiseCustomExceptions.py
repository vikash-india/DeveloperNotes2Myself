# Description: Try-Finally Block

"""
### Note
* Create custom exceptions using a new class.
* This exception class has to be derived, either directly or indirectly from Exception class.
* Most of the built-in exceptions are also derived form this class.
"""

import sys


# Define a custom exception directly inheriting from Exception class
class CustomError(Exception):
    pass


# Define a custom exception indirectly inheriting from Exception class through Error class
class Error(Exception):
    """Base class for other exceptions"""
    pass


class ValueTooSmallError(Error):
    """Raised when the input value is too small"""
    pass


class ValueTooLargeError(Error):
    """Raised when the input value is too large"""
    pass


random_list = ["a", 0, 200, "#", 25, 50]

for item in random_list:
    try:
        if item == "a":
            # Raise a custom exception with a custom message.
            raise CustomError("String a is used!")
        elif item == "#":
            # Raise a custom exception without a custom message.
            raise CustomError
        else:
            a = int(item)
            if a > 100:
                raise ValueTooLargeError("Value is too large")
            elif a <= 0:
                raise ValueTooSmallError("Value is too small")
            else:
                reciprocal = 1 / a
                print("The reciprocal {} is {}".format(item, reciprocal))
    except CustomError:
        print("Error: ", sys.exc_info()[0])
    except:
        # Catch all other exceptions
        print("Error: ", sys.exc_info()[0])
    finally:
        # Do something
        pass
