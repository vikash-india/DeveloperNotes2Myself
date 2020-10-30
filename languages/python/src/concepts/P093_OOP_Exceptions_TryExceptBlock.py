# Description: Exception Handling Using Try-Except Block

import sys

random_list = ["a", 0, 2, "#", 33]

for item in random_list:
    try:
        reciprocal = 1 / int(item)
        print("The reciprocal {} is {}".format(item, reciprocal))
    except ValueError:
        # Handle one exception type ValueError
        print("ValueError: ", sys.exc_info()[0])
    except (TypeError, ZeroDivisionError):
        # Handle multiple exceptions type - TypeError and ZeroDivisionError
        print("TypeError or ZeroDivisionError: ", sys.exc_info()[0])
    except:
        # Handle all other exceptions
        print("Error: ", sys.exc_info()[0])
