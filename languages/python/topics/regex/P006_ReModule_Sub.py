# Description: The re.sub Function

import re

"""
Note
1. The syntax: re.sub(pattern, replacement, string, count=0, flags=0).
2. This function returns the string obtained by replacing the leftmost non-overlapping occurrences of pattern in string
   by the replacement. If the pattern isn't found, the original string is returned unchanged.
3. The replacement can be a string or a function.
4. If it is a string, any backslash escapes in it are processed. That is, \n is converted to a single newline character,
   \r is converted to a carriage return, and so forth. Unknown escapes such as \j are left alone. Backreferences, such
   as \6, are replaced with the substring matched by group 6 in the pattern.
5. If replacement is a function, it is called for every non-overlapping occurrence of pattern. The function takes a
   single match object argument, and returns the replacement string.
5. The pattern may be a string or an RE object.
6. The optional argument count is the maximum number of pattern occurrences to be replaced; count must be a non-negative
   integer. If omitted or zero, all occurrences will be replaced.
"""

# Replacement Using String
text = "I had an interesting dream last night!"
pattern = r'dream'
replacement = 'idea'
new_text = re.sub(pattern, replacement, text, flags=re.IGNORECASE)
print "The new_text:", new_text

# Replacement Using Function
def dashReplacement(matchobj):
    if matchobj.group(0) == '-':
        return ' '
    else:
        return '-'

text = 'pro----gram-files'
pattern = '-{1,2}'
new_text = re.sub(pattern, dashReplacement, text)               # 'pro--gram files'
print "The new_text:", new_text
