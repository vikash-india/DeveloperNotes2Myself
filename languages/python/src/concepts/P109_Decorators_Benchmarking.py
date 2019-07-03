# Description: Benchmarking Using Decorators

import time


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


def recursive_factorial(number):
    """Compute factorial of a number RECURSIVELY."""

    if number == 1:
        return 1
    else:
        return number * recursive_factorial(number-1)


def timed_call(function, *args):
    """
    Calls function(*args)

    Return the tuple(time in seconds, result).
    """

    t0 = time.clock()
    result = function(*args)
    t1 = time.clock()

    return t1 - t0, result


def timed_calls(n, function, *args):
    """
    Call function(*args) repeatedly as follows,
        Case 1: Call function n times if n is an int.
        Case 2: Call function up to N seconds if n is a float.

    Returns the minimum, average and maximum time
    """
    if isinstance(n, int):
        times = [timed_call(function, *args)[0] for _ in range(n)]
    else:
        times = []
        while sum(times) < n:
            times.append(timed_call(function, *args)[0])

    return min(times), average(times), max(times)


def average(numbers):
    """
    Return the average (arithmetic mean) of a sequence of numbers.
    """
    return sum(numbers) / float(len(numbers))


def benchmark(n, function, *args):
    """
    Usage Examples
        benchmark(100, answer)                  - Run answer() 100 times.
        benchmark(100, answer, 'a=1, b=2')      - Run answer(a=2, b=3) 100 times.
        print benchmark(100, answer, '1, 2')    - Run answer(a, b) 100 times.
        print benchmark(100, answer, 1, 2)      - Run answer(a, b) 100 times.
    """
    (minimum_time, average_time, maximum_time) = timed_calls(n, function, *args)
    print ('Time (In seconds) for {} runs: Minimum: {}, Average: {}, Maximum: {} for function call {} with args {}'.format
           (n, minimum_time, average_time, maximum_time, function.__name__, args))


if __name__ == '__main__':
    number = 10000
    runs = 1

    # Without Memoization - factorial
    benchmark(runs, factorial, number)

    # WITH Memoization - factorial
    factorial = memoize(factorial)
    benchmark(runs, factorial, number)

    # Without Memoization - Factorial from Python library
    from math import factorial as python_factorial
    benchmark(runs, python_factorial, number)

    # WITH Memoization - Factorial from Python library
    python_factorial = memoize(python_factorial)
    benchmark(runs, python_factorial, number)

    # Without Memoization - Recursive Factorial
    # Note: Wont run for large number
    # benchmark(runs, recursive_factorial, number)

    # WITH Memoization - Recursive Factorial
    # Note: Wont run for large number
    # recursive_factorial = memoize(recursive_factorial)
    # benchmark(runs, recursive_factorial, number)
