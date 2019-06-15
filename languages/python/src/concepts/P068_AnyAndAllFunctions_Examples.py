# Description: Any and All Functions

# Note
# 1. Any and All functions work on the Truthy and Falsy values of different data types, sequences or lists.

from decimal import Decimal
from fractions import Fraction

class Foo:
    def __bool__(self):
        return False

class Bar:
    def __len__(self):
        return 0

class Foobar:
    pass

# Create objects
foo = Foo()
bar = Bar()
foobar = Foobar()

# All Falsy Values in Python
print("Falsy Value in Python")
print(bool(None))                                   # None
print(bool(False))	                                # False
print(bool(0))	                                    # 0
print(bool(0.0))	                                # 0.0
print(bool(0j))	                                    # 0j
print(bool(Decimal(0)))	                            # Decimal(0)
print(bool(Fraction(0, 1)))	                        # Fraction(0, 1)
print(bool([]))	                                    # [] - An empty list
print(bool({}))	                                    # {} - An empty dictionary
print(bool(()))	                                    # () - An empty tuple
print(bool(''))	                                    # '' - An empty string
print(bool(b''))	                                # b'' - An empty bytes
print(bool(set()))	                                # set() - An empty set
print(bool(range(0)))	                            # range(0) - An empty range
print(bool(foo))	                                # The return value of object.__bool__() if it is defined.
print(bool(bar))	                                # The return value of object.__len__() if __bool__() is undefined.
print(bool(foobar))	                                # If a class defines neither __len__() nor __bool__(), all its
                                                    # instances are considered true.

# Any and All
print()
print("Any: ", any([True, False, False]))           # True if any of the value is True
print("All: ", all([True, True, True]))             # True if any of the value is True

print()
print("Any: ", any([0, 2, 3]))                      # True if any of the value is True
print("All: ", all([0, 1, 2]))                      # True if all the values are True

# Interesting Case of Empty Iterables
empty=[]
print()
print("Any for Empty Iterables:", any(empty))       # Any returns False for Empty iterables.
print("All for Empty Iterables:", all(empty))       # All returns True for Empty iterables.
print("Bool for Empty Iterables:", bool(empty))     # All returns True for Empty iterables.
print()
print("Correct All:", bool(empty) and all(empty))   # Proper way to check an iterable
print("Correct Any", bool(empty) and any(empty))    # Proper way to check an iterable
print("Ok Any", bool(empty) or any(empty))          # Even this will work for Any
