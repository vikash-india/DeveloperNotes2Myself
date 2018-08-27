# Description: The re.MatchObject

import re

"""
Note
1. The re.MatchObject always have a boolean value of True. Since match() and search() return None when there is no
   match, one can test whether there was a match with a simple if statement.
2. The re.MatchObject supports following methods
    - expand(template)
    - group([group1, ...])
    - groups([default])
    - groupdict([default])
    - start([group])
    - end([group])
    - span([group])
3. The re.MatchObject support following attributes
    - pos
    - endpos
    - lastindex
    - lastgroup
    - re
    - string
4. The MatchObject.expand(template) Method
    - Return the string obtained by doing backslash substitution on the template string template, as
      done by the sub() method.
    - Escapes such as \n are converted to the appropriate characters, and numeric backreferences (\1, \2) and named
      backreferences (\g<1>, \g<name>) are replaced by the contents of the corresponding group.
5. The MatchObejct.group() Method
    - Returns one or more subgroups of the match.
    - If there is a single argument, the result is a single string.
    - If there are multiple arguments, the result is a tuple with one item per argument.
    - Without arguments, group defaults to zero (the whole match is returned).
    - If a groupN argument is zero, the corresponding return value is the entire matching string. If it is in the
      inclusive range [1..99], it is the string matching the corresponding parenthesized group.
    - If a group number is negative or larger than the number of groups defined in the pattern, an IndexError exception
      is raised.
    - If a group is contained in a part of the pattern that did not match, the corresponding result is None.
    - If a group is contained in a part of the pattern that matched multiple times, the last match is returned.

"""
# Example 1
text = "The only relationship I have is with my Wi-Fi. We have a connection.";
pattern = r'relationship (.*) is with my (.*?)\.'
matchObject = re.search(pattern, text, re.M | re.I)
if matchObject:
    print "All Groups:", matchObject.groups()

    print 'The entire match:', matchObject.group()              # The entire match
    print 'The entire match:', matchObject.group(0)             # Same as above.

    print 'Group 1:', matchObject.group(1)                      # The first parenthesized subgroup.
    print 'Group 2:', matchObject.group(2)                      # The second parenthesized subgroup.

    print 'Group 1 & 2 as a Tuple:', matchObject.group(1, 2)    # Multiple arguments give us a tuple.


    template = r'\1\n\2.'
    print "\n", matchObject.expand(template)                    # expand(template)
else:
    print 'No match found.'


# Example 2: Grouped Name Example
# 1. If the regular expression uses the (?P<name>...) syntax, the groupN arguments may also be strings identifying
#    groups by their group name.
# 2. If a string argument is not used as a group name in the pattern, an IndexError exception is raised.
print '\nGrouped Name Example'

text = 'Scott Adams'
pattern = r'(?P<first_name>\w+) (?P<last_name>\w+)'
matchObject = re.match(pattern, text)
print matchObject.group('first_name')     # Scott
print matchObject.group('last_name')      # Adams
print matchObject.group(1)                # Scott. Named groups can also be referred to by their index.
print matchObject.group(2)                # Adams.
print matchObject.groupdict()             # Return a dictionary containing all the named subgroups of the match, keyed by the subgroup name.

# Example 3: Multiple Match Pattern
# 3. If a group matches multiple times, only the last match is accessible:
print '\nExample 3: Multiple Match Pattern'
text = 'a1b2c3'
pattern = r'(..)+'
matchObject = re.match(pattern, text)  # Matches 3 times.
print matchObject.group(1)