# Description: Raise Built-in Exceptions

import sys

random_list = ["a", 0, 2, "#", 33]

for item in random_list:
    try:
        if item == "a":
            # Raise a built-in exception with a custom message.
            raise MemoryError("Consuming too much memory!")
        elif item == "#":
            # Raise a built-in exception without a custom message.
            raise KeyboardInterrupt
        else:
            a = int(item)
            if a <= 0:
                # Raise a built-in exception with a custom message.
                raise ValueError("Positive number is needed!")
            else:
                reciprocal = 1 / a
                print("The reciprocal {} is {}".format(item, reciprocal))
    except ValueError:
        # Handle ValueError exception
        print("ValueError: ", sys.exc_info()[0])
    except (TypeError, ZeroDivisionError):
        # Handle TypeError and ZeroDivisionError exception
        print("TypeError or ZeroDivisionError: ", sys.exc_info()[0])
    except:
        # Handle all other exceptions including KeyboardInterrupt exception
        print("Error: ", sys.exc_info()[0])
