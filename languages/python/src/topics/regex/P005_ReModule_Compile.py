# Description: The re.compile Function

import re

"""
Note
1. The syntax: re.compile(pattern, flags=0).
2. Compile a regular expression pattern into a regular expression object. The RegexObject can then be used for matching
   using its methods like match(), search(), split(), findall(), finditer(), sub(), subn().
3. Using re.compile() and saving the resulting regular expression object for reuse is more efficient when the
   expression will be used several times in a single program.
4. The expression's behaviour can be modified by specifying a flags value. Values can be any of the following
   variables, combined using bitwise OR (the | operator).
"""

text = 'A quick brown fox jumps over the lazy dog.'
pattern = 'fox'

# Alternative to matches = re.search(pattern, string)
regexObject = re.compile(pattern)
matchObject = regexObject.search(text)

if (matchObject):
    print 'Found'
else:
    print 'No match found!'
