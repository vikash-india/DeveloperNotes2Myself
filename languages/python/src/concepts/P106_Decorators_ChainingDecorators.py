# Description: Chaining Decorators

"""
### Note
* The order in which we chain decorators matters.
"""

def star(func):
    def inner_function(*args, **kwargs):
        print("*" * 30)
        func(*args, **kwargs)
        print("*" * 30)

    return inner_function


def percent(func):
    def inner_function(*args, **kwargs):
        print("%" * 30)
        func(*args, **kwargs)
        print("%" * 30)

    return inner_function


def underscore(func):
    def inner_function(*args, **kwargs):
        print("_" * 30)
        func(*args, **kwargs)
        print("_" * 30)

    return inner_function


# Chain Decorators
@star
@percent
@underscore
def function_1(message):
    print(message)


def function_2(message):
    print(message)


if __name__ == '__main__':
    function_1("Hello World")
    print("\n\n\n\n\n")

    # Chain Decorators - Alternate way
    function_2 = (star(percent(underscore(function_2))))
    function_2("Hello World")
