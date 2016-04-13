# Description: String Built-in Methods

# Concatenation
sentence = "PI is "                 # Unlike a C string, Python strings cannot be changed.
pi = 3.14
print sentence + str(pi)            # Convert other forms to string. Unlike Java, the '+' does not automatically convert
                                    # numbers or other types to string form.

# String Testing Methods
print ' education'.islower()        # True. Return true if all cased characters in the string are lowercase and there is
                                    # at least one cased character, false otherwise.
print 'EDUCATION   '.isupper()      # True. Return true if all cased characters in the string are uppercase and there
                                    # is at least one cased character, false otherwise.
print 'Education Works!'.istitle()  # True. Return true if the string is a titlecased string and there is at least one
                                    # character. Uppercase characters may only follow uncased characters and lowercase
                                    # characters may only follow cased ones. Return false otherwise.
print '  ABC  '.isspace()           # False. Return true if there are only whitespace characters in the string and there
                                    # is at least one character (ie string is not empty), false otherwise.
print 'ABC123abc'.isalnum()         # True. Return true if all characters in the string are alphanumeric and there is at
                                    # least one character, false otherwise.
print 'ABCabc'.isalpha()            # True. Return true if all characters in the string are alphabetic and there is at
                                    # least one character, false otherwise.
print '12345'.isdigit()             # Return true if all characters in the string are digits and there is at least one
                                    # character, false otherwise.

# Case Conversion Methods
print 'EdUcaTIOn'.lower()           # education. Convert all characters to lower case.
print 'education'.upper()           # EDUCATION. Convert all characters to upper case.
print 'education'.capitalize()      # Education. Capitalizes first letter of string.
print "I'm a writer-editor".title() # I'M A Writer-Editor. Return a title-cased version of the string where words start
                                    # with an uppercase character and the remaining characters are lowercase. A word is
                                    # a group of consecutive letters. This definition works in many contexts but it
                                    # also means that apostrophes in contractions and possessives form word boundaries,
                                    # which may not be the desired result.
print 'EDUCAtion'.swapcase()        # educaTION. Return a copy of the string with uppercase characters converted to
                                    # lowercase and vice versa.

# Space Manipulation Methods
print '   Education   '.strip()     # Education.Remove leading and trailing spaces from either side of the string.
print '   Education   '.lstrip()    # 'Education   '. Remove leading spaces from the string.
print '   Education   '.rstrip()    # '   Education'. Remove trailing spaces from the string.
tabbedWord = '01\t012\t0123\t01234'
print tabbedWord.expandtabs(4)      # 01  012 0123    01234. Return a copy of the string where all tab characters are
                                    # replaced by one or more spaces, depending on the current column and the given tab
                                    # size. Tab positions occur every tabsize characters (default is 8, giving tab
                                    # positions at columns 0, 8, 16 and so on).To expand the string, the current column
                                    # is set to zero and the string is examined character by character. If the character
                                    # is a tab (\t), one or more space characters are inserted in the result until the
                                    # current column is equal to the next tab position. (The tab character itself is not
                                    # copied.) If the character is a newline (\n) or return (\r), it is copied and the
                                    # current column is reset to zero. Any other character is copied unchanged and the
                                    # current column is incremented by one regardless of how the character is
                                    # represented when printed.
print 'ABC'.center(21, '-')         # ---------ABC---------. Return centered in a string of length width. Padding is
print 'ABC'.ljust(21, '-')          # ABC------------------. Return the string left justified in a string of length
                                    # width. Padding is done using the specified fillchar (default is a space).
print 'ABC'.rjust(21, '-')          # ------------------ABC. Return the string right justified in a string of length
                                    # width. Padding is done using the specified fillchar (default is a space). The
                                    # original string is returned if width is less than or equal to len(s).
print "-123.3".zfill(10)            # -0000123.3. Return the numeric string left filled with zeros in a string of length
                                    # width. A sign prefix is handled correctly. The original string is returned if
                                    # width is less than or equal to len(s).

# String Search Methods
print 'education'.startswith('edu') # True. Tests if the string starts with the given other string.
print 'education'.endswith('tion')  # True. Tests if the string ends with the given other string.
print 'abracadabra'.find('abra')    # 0. Return the lowest index in the string where substring sub is found within the
                                    # slice s[start:end]. Returns -1 otherwise. Start and end defaults to None.
print 'abracadabra'.rfind('abra')   # 7. Return the highest index in the string where substring sub is found, within the
                                    # slice s[start:end]. Returns -1 otherwise. Start and end defaults to None.
print 'abracadabra'.index('abra')   # 0. Like find(), but raise ValueError when the substring is not found. Optionally
                                    # start and end can be given for slicing.
print 'abracadabra'.rindex('abra')  # 7. Like rfind() but raises ValueError when the substring sub is not found.
                                    # Optionally start and end can be given for slicing.
str = 'A rose is a rose is a rose.'
print str.count('rose', 0, 20)      # 2. Return the number of non-overlapping occurrences of substring 'rose' in the
                                    # range [start, end]. Optional arguments start and end are interpreted as in slice
                                    # notation.

# String Manipulation Methods
print 'hat sat'.replace('a', 'ea')  # heat seat. Return a copy of the string with all occurrences of substring old
                                    # replaced by new. If the optional argument count is given, only the first count
                                    # occurrences are replaced. Eg. 'hat sat'.replace('a', 'ea', 1) returns heat sat.

print 'A,B,C,D,E'.split(',')        # ['A', 'B', 'C', 'D', 'E']. Return a list of the words in the string, using sep as
                                    # the delimiter string. If maxsplit is given, at most maxsplit splits are done (the
                                    # list will have at most maxsplit + 1 elements). If maxsplit is not specified or -1,
                                    # then there is no limit on the number of splits (all possible splits are made).
print 'A,B,C,D,E'.rsplit(',', 2)    # ['A,B,C', 'D', 'E']. Return a list of the words in the string, using sep as the
                                    # delimiter string. If maxsplit(2 in the example) is given, at most maxsplit splits
                                    # are done, the rightmost ones. If sep is not specified or None, any whitespace
                                    # string is a separator.

print 'ab++cd++ef'.partition('++')  # ('ab', '++', 'cd++ef'). Split the string at the first occurrence of sep, and
                                    # return a 3-tuple containing the part before the separator, the separator itself,
                                    # and the part after the separator. If the separator is not found, return a 3-tuple
                                    # containing the string itself, followed by two empty strings.
print 'ab++cd++ef'.rpartition('++') # ('ab++cd', '++', 'ef'). Split the string at the last occurrence of sep, and return
                                    # a 3-tuple containing the part before the separator, the separator itself, and the
                                    # part after the separator. If the separator is not found, return a 3-tuple
                                    # containing two empty strings, followed by the string itself.

word = 'ab c\n\nde fg\rkl\r\n'
print word.splitlines()             # ['ab c', '', 'de fg', 'kl']. Return a list of the lines in the string, breaking at
                                    # line boundaries. Line breaks are not included in the resulting list unless keepends
                                    # argument is set to true. The word.splitlines(True) will return
                                    # ['ab c\n', '\n', 'de fg\r', 'kl\r\n']
print "---".join(['A', 'B', 'C'])   # Opposite of split(). Joins the elements in the given list together using the
                                    # string as the delimiter

# String Translation Methods
str = "An example phrase!";
tableIn = "aeiou"
tableOut = "12345"
from string import maketrans        # Use the string module's maketrans() helper function to create a translation table.
transTable = maketrans(tableIn, tableOut)
print str.translate(transTable)     # An 2x1mpl2 phr1s2!.

str = 'read this short text'
print str.translate(None, 'aeiou')  # rd ths shrt txt. Return a copy of the string where all characters occurring in the
                                    # optional argument deletechars are removed, and the remaining characters have been
                                    # mapped through the given translation table, which must be a string of length 256.
                                    # For string objects, set the table argument to None for translations that only
                                    # delete characters:

# TODO
# unicode.isnumeric()
# unicode.isdecimal()
# str.decode
# str.encode
