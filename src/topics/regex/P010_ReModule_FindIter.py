# Description: The re.findall Function

import re

"""
Note
1. The syntax: re.finditer(pattern, string, flags=0)
2. This function returns an iterator yielding MatchObject instances over all non-overlapping matches for the RE pattern
   in the string. The string is scanned left-to-right, and matches are returned in the order found.
3. Empty matches are included in the result unless they touch the beginning of another match.
"""
text = 'a@example.com, blah blah b@example.com more blah blah again c@example.com' # A text containing many email Ids
emailPattern = r'([\w\.-]+@[\w\.-]+)'             # A patern to get a list of all the email strings

for match in re.finditer(emailPattern, text, re.IGNORECASE):
    print "Position %s: %s" % (match.start(), match.group(1))
