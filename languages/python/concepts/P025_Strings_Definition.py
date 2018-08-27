# Description: Strings in Python

string_1 = "String can be in double quotes."
string_2 = 'String can be in single quotes.'
string_3 = "String in double quotes can contain single quotes ' like this."
string_4 = 'String in single quotes can contain double quotes " like this.'
string_5 = "String in double quotes can contain double quotes after escaping it \" like this."
string_6 = 'String in single quotes can contain single quotes after escaping it \' like this.'

# Format Specifiers within a string
string_7 = "String can have a formatter %d > %d = %r " % (2, 3, 2 > 3)

# Multi-line strings
string_8 = "String can be spread over multi line by adding a backslash at the end of each line. \
Newlines need to be embedded in the string using \n because the newline following the trailing backslash is discarded."

string_9 = """Strings can be surrounded in a pair of matching triple-quotes: either single quotes or double quotes
and the end of lines do not need to be escaped but they will be included in the string itself
"""

string_10 = '''Adam and Eve are like imaginary numbers, like the square root of minus %d...
If you include it in your equation, you can calculate all manners of things,
which cannot be imagined without it.''' % 1

# A few other ways of constructing a string
string_11 = 'Test' ' Second String' ' Test' + " 2" # Two string literals next to each other are concatenated.
string_12 = "String concatenation: " + string_1 + "\t\t\t" + string_2

print (string_9)
