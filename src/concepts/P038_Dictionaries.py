# Description: Dictionaries in Python

# Note
# 1. A dictionary is an UNORDERED key: value pairs, with the requirement that the keys are unique within a dictionary.
# 2. Dictionary in other languages are also called "associative memories", "associative arrays", "hash map" etc.
# 3. Dictionary Keys
#    - Dictionaries are indexed by keys, which can be any immutable type; strings and numbers can always be keys.
#    - Tuples can be used as keys if they contain only strings, numbers, or tuples; if a tuple contains any mutable
#      object either directly or indirectly, it cannot be used as a key.
#    - List cannot be used as keys, since lists can be modified in place using index assignments, slice assignments, or
#      methods like append() and extend().
# 4. It is an error to extract a value using a non-existent key.

# Create dictionary
info = {}                                                # Empty dictionary
info = {'AAAA': 1111, 'BBBB': 2222}
info['CCCC'] = 3333
dictionary1 = dict([('DDDD', 4444), ('EEEE', 5555)])    # Use the dict() constructor to build dictionaries directly from
                                                        # the sequences of key-value pairs.
dictionary2 = dict(sape=4139, guido=4127, jack=4098)    # When the keys are simple strings, it is sometimes easier to
                                                        # specify pairs using keyword arguments.
# Accessing Dictionary
print(info)
print(info['jack'])
print(list(info.keys()))                                # Return a list of keys
print(sorted(info.keys()))                              # A list of SORTED keys
print(dictionary1)
print(dictionary2)

# Modifying dictionary
del info['sape']
info['irv'] = 4127

# The 'in' operator
print('guido' in info)                                  # Returns True or False
print('jack' not in info)

# Dictionary comprehensions
anotherDictionary = {x: x**2 for x in (2, 4, 6)}        # Dictionaries from an arbitrary key and value expressions
print(anotherDictionary)
