# Description: Class Based Decorators

"""
### Note
* If you want to maintain some sort of state and/or just make your code more confusing, use class based decorators.
"""


class ClassBasedDecorator(object):

    def __init__(self, function_to_decorate):
        print("INIT ClassBasedDecorator")
        self.function_to_decorate = function_to_decorate

    def __call__(self, *args, **kwargs):
        print("CALL ClassBasedDecorator")
        return self.function_to_decorate(*args, **kwargs)


# Call Class Based Decorator
@ClassBasedDecorator
def function_1(*args):
    for arg in args:
        print(arg)

def function_2(*args):
    for arg in args:
        print(arg)


if __name__ == '__main__':
    function_1(1, 2, 3)

    # Call Class Based Decorator - Alternate way
    function_2 = ClassBasedDecorator(function_2)
    function_2(1, 2, 3)
