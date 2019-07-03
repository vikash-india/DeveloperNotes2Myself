# Description: Memoize Using Closure


def memoize(f):
    """
    A decorator that caches the return value for each call to f(args).
    Then when called again with some arguments, we can just look it up.
    """
    cache = {}

    def _f(*args):
        try:
            return cache[args]
        except KeyError:
            cache[args] = result = f(*args)
            return result
        except TypeError:
            """Some elements of args cannot be a dict key"""
            return f(args)

    return _f


def factorial(num):
    """Compute factorial of a number."""

    result = 1
    if num < 0:
        raise Exception('ValueError: factorial() not defined for negative values')
    elif num == 0:
        return result
    else:
        for i in range(1, num + 1):
            result = result * i
        return result


if __name__ == '__main__':
    number = 100000

    # Without Memoization
    result = factorial(number)
    print("The factorial of {} is {}: ".format(number, result))

    # With Memoization
    # Memoize factorial
    factorial = memoize(factorial)
    result = factorial(number)
    print("The factorial of {} is {}: ".format(number, result))
