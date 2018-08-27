# Description: The re.escape() and re.purge() Functions

import re

"""
Note
1. The syntax: re.escape(string).
2. The re.escape function returns string with all non-alphanumerics backslashed.
3. This is useful for matching an arbitrary literal string that may have regular expression metacharacters in it.
"""
string = '^a.*$'
escapedString = re.escape(string)
print escapedString

"""
Note
1. The syntax: re.purge().
2. The re.purge() clears the regular expression cache.
"""
# Call this method when the compiled or cached regex should be discarded
re.purge()
