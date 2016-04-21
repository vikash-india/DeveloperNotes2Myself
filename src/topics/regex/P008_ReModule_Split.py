# Description: The re.split Function

import re

"""
Note
1. The syntax: re.split(pattern, string, maxsplit=0, flags=0).
2. This function splits string by the occurrences of pattern. If capturing parentheses are used in pattern, then the
   text of all groups in the pattern are also returned as part of the resulting list.
3. If maxsplit is nonzero, at most maxsplit splits occur, and the remainder of the string is returned as the final
   element of the list.
4. If there are capturing groups in the separator and it matches at the start of the string, the result will start with
   an empty string. The same holds for the end of the string.
5. The split method will never split a string on an empty pattern match.
"""
text = 'Words, words, words.'
print re.split('\W+', text)                                 # ['Words', 'words', 'words', '']
print re.split('(\W+)', text)                               # ['Words', ', ', 'words', ', ', 'words', '.', '']
print re.split('\W+', text, 1)                              # ['Words', 'words, words.']

print re.split('[a-f]+', '0a3B9', flags=re.IGNORECASE)      # ['0', '3', '9']
print re.split('(\W+)', '...words, words...')               # ['', '...', 'words', ', ', 'words', '...', '']
print re.split('x*', 'foo')                                 # ['foo']
