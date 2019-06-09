# Description: The re.match Function

import re

"""
Note
1. The syntax: re.match(pattern, string, flags=0).
2. The function checks for a match ONLY AT THE BEGINNING of the string. Even in MULTILINE mode, re.match() will
   only match at the beginning of the string and not at the beginning of each line.
3. The re.match function returns a match object on success. Returns None if the string does not match the pattern; note
   that this is different from a zero-length match.
4. Use group(num) or groups() function of match object to get matched expression.
"""

text = "The only relationship I have is with my Wi-Fi. We have a connection."

matchObject = re.match(r'.* relationship (.*) is with my (.*?)\.', text, re.M | re.I)

if matchObject:
    print "The matches.group():", matchObject.group()     # Returns entire match.
    print "The matches.groups():", matchObject.groups()   # Returns all matching subgroups in a tuple, empty otherwise.
    print "The matches.group(1):", matchObject.group(1)   # Returns specific subgroup num. Subgroup 1 in this case.
    print "The matches.group(2):", matchObject.group(2)   # Subgroup 2 in this case.
else:
    print "No match found!"
