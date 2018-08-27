# Description: Sets in Python

# Note
# 1. A set is an UNORDERED collection with NO DUPLICATES elements.
# 2. Curly braces or the set() function can be used to create sets.
# 3. Basic uses include membership testing and eliminating duplicate entries.
# 4. Set objects also support mathematical operations like union, intersection, difference, and symmetric difference.

# Create sets
empty_set = set()                                   # Empty Set. The {} creates an empty dictionary, hence cannot be
                                                    # used for sets.
basket = {'apple', 'orange', 'apple', 'banana'}
print(basket)                                       # No Duplicates in sets

# The in operator
print('crabgrass' in basket)                        # The 'in' or 'not in' operator can be used.
if 'orange' in basket:                              # Fast membership testing.
    print('Orange Found!')

# Set operations
a = set('abracadabra')                              # Set of letters created from the word 'abracadabra'
b = set('alacazam')
print(a)                                            # Unique letters in a
print(a - b)                                        # SUBTRACTION. Letters in a but not in b
print(a | b)                                        # UNION. letters in either a or b
print(a & b)                                        # INTERSECTION. letters in both a and b
print(a ^ b)                                        # SYMMETRIC DIFFERENCE. letters in a or b but not both

# Set methods
basket.add('pear')                                  # Add elements into a set.

# Set comprehension
setA = {x for x in 'abracadabra' if x not in 'abc'}

# Testing Equality of two sets
# 1. Use == for Equality Test
# 2. Use != for Not Equality Test
s1 = set([1,2,4,5]);
s2 = set([2,4,5,1]);
if s1 == s2:
    print 'Set Equal'
else:
    print 'Set NOT Equal'
