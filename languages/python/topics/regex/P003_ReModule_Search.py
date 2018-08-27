# Description: The re.search Function

import re

"""
Note
1. The syntax: re.search(pattern, string, flags=0).
2. The function scans through string looking for the first location where the regular expression pattern produces a
   match. The re.search function checks for a match ANYWHERE in the string (Just as in Perl).
3. The re.search function returns a match object on success or returns None if no position in the string matches the
   pattern; note that this is different from finding a zero-length match at some point in the string.
4. Use group(num) or groups() function of match object to get matched expression.
"""

text = "The only relationship I have is with my Wi-Fi. We have a connection.";

matchObject = re.search(r'relationship (.*) is with my (.*?)\.', text, re.M | re.I)

if matchObject:
    print "searches.group():", matchObject.group()
    print "searches.groups():", matchObject.groups()
    print "searches.group(1):", matchObject.group(1)
    print "searches.group(2):", matchObject.group(2)
else:
    print "No match found!"
