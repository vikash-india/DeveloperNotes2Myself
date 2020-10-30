# Description: Class Based Decorators

"""
### Note
* If you want to maintain some sort of state and/or just make your code more confusing, you can also use class based
  decorators.
"""


class ClassBasedDecoratorWithParams(object):

    def __init__(self, arg1, arg2):
        print("INIT ClassBasedDecoratorWithParams")
        print("Do something with aruments: {} and {}".format(arg1,arg2))

    def __call__(self, fn, *args, **kwargs):
        print("CALL ClassBasedDecoratorWithParams")

        def new_func(*args, **kwargs):
            print("Congratulations! Function has been decorated.")
            return fn(*args, **kwargs)
        return new_func


# Call Class based decorator with arguments
@ClassBasedDecoratorWithParams("arg1", "arg2")
def function_1(*args):
    for arg in args:
        print(arg)


def function_2(*args):
    for arg in args:
        print(arg)


if __name__ == '__main__':
    function_1(1, 2, 3)

    # Call Class based decorator with arguments - Alternate way
    function_2 = (ClassBasedDecoratorWithParams("arg3", "arg4s"))(function_2)
    function_2(1, 2, 3)
