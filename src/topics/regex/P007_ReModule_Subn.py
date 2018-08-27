# Description: The re.subn Function

import re

"""
Note
1. The syntax: re.subn(pattern, replacement, string, count=0, flags=0).
2. Perform the same operation as sub(), but return a tuple (new_string, number_of_subs_made).
"""
text = "I had an interesting dream last night!"
pattern = r'dream'
replacement = 'idea'
tuple = re.subn(pattern, replacement, text, flags=re.IGNORECASE)
print "The tuple:", tuple
