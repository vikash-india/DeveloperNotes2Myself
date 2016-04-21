# Description: Regular Expression Error Handling Using re.error

import re

"""
Note
1. The exception is handled using re.error.
"""
pattern = r'(\W+' # Missing right parenthesis
try:
    regex = re.compile(pattern, re.IGNORECASE)
except re.error, message:
    print 're.error: ', message

    # Do something here
    customMessage = "Regular expression error in %s: %s" % (pattern, message)
    raise re.error, customMessage
