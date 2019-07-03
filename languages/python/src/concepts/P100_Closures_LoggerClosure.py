# Description: Logging Using Closure

import logging

logging.basicConfig(filename='example.log', level=logging.INFO)


def logger(func):

    def log_function(*args):
        logging.info(
            'Running "{}" with arguments {}'.format(func.__name__, args))

        print(func(*args))

    # Returning WITHOUT parenthesis is NECESSARY for closure to work!
    return log_function


# Function to add
def add(x, y):
    return x + y


# Function to subtract
def subtract(x, y):
    return x - y


if __name__ == '__main__':
    add_logger = logger(add)
    sub_logger = logger(subtract)

    add_logger(3, 3)
    add_logger(4, 5)

    sub_logger(10, 5)
    sub_logger(20, 10)
