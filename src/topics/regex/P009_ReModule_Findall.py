# Description: The re.findall Function

import re

"""
Note
1. The syntax: re.findall(pattern, string, flags=0).
2. The findall() function finds ALL the matches and returns them as a list of strings, with each string representing
   one match.
2. It returns all non-overlapping matches of pattern in string, as a list of strings. The string is scanned
   left-to-right, and matches are returned in the order found.
3. If one or more groups are present in the pattern, return a list of groups; this will be a list of tuples if the
   pattern has more than one group. Empty matches are included in the result unless they touch the beginning of another
   match.
"""
# Example 1: Using re.findall on String
text = 'a@example.com, blah blah b@example.com more blah blah again c@example.com' # A text containing many email Ids
emailPattern = r'[\w\.-]+@[\w\.-]+'             # A patern to get a list of all the email strings
emails = re.findall(emailPattern, text)         # ['a@example.com', 'b@example.com', 'c@example.com']

print 'Using re.findall on String'
for email in emails:
    print email


# Example 2: Using re.findall on File
filename = 'P007_ReModule_FindallData.txt'
file = open(filename, 'r')

# Feed the file text into findall() to get a list of strings
emails = re.findall(emailPattern, file.read())  # f.read() returns the whole text of a file in a single string
print '\nUsing re.findall on File'
for email in emails:
    print email


# Example 3: Using re.findall with Groups
text = 'blah blah a@example.com, blah blah again b@example.com more blah blah'
pattern = r'([\w\.-]+)@([\w\.-]+)'
listOfTuples = re.findall(pattern, text)        # [('a', 'example.com'), ('b', 'example.com')]

print '\nUsing re.findall with Groups'
print 'listOfTuples: ', listOfTuples
for tuple in listOfTuples:
    print tuple[0], tuple[1]                    # Username, Domain
