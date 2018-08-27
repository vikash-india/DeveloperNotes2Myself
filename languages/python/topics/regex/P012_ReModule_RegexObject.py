# Description: The re.RegexObject

import re

"""
Note
1. The re.RegexObject supports following methods
    - search(string[, pos[, endpos]])
    - match(string[, pos[, endpos]])
    - split(string, maxsplit=0)
    - findall(string[, pos[, endpos]])
    - finditer(string[, pos[, endpos]])
    - sub(repl, string, count=0)
    - subn(repl, string, count=0)
2. The re.RegexObject supports following attributes
    - flags: The regex matching flags. This is a combination of the flags given to compile() and any (?...) inline flags
      in the pattern.
    - groups: The number of capturing groups in the pattern.
    - groupindex: A dictionary mapping any symbolic group names defined by (?P<id>) to group numbers. The dictionary is
      empty if no symbolic groups were used in the pattern.
    - pattern: The pattern string from which the RE object was compiled.
3. The position parameter
    - The optional second parameter position gives an index in the string where the search is to start.
    - It defaults to 0.
    - This is not completely equivalent to slicing the string. The '^' pattern character matches at the real beginning
      of the string and at positions just after a newline, but not necessarily at the index where the search is to
      start.
4. The endposition parameter
    - The optional parameter endposition limits how far the string will be searched.
    - It will be as if the string is endpos characters long, so only the characters from position to endposition - 1
      will be searched for a match.
    - If endposition is less than position, no match will be found, otherwise, if regexObject is a compiled regular
      expression object, regexObjectx.search(string, 0, 50) is equivalent to rx.search(string[:50], 0).
"""
text = 'A bone to the dog is not charity. Charity is the bone shared with the dog, when you are just as hungry as the dog.'
pattern = 'dog'

regexObject = re.compile(pattern)

matchObject = regexObject.findall(text, pos=0, endpos=len(text)-3)
if matchObject:
    print 'Total Matches:', len(matchObject)
else:
    print 'No match found!'
