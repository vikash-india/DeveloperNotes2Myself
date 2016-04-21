# Description: The Options Flags

import re

"""
Options                 Description
------------------------------------------------------------------------------------------------------------------------
re.DEBUG                Display debug information about compiled expression.
re.I or re.IGNORECASE   Perform case-insensitive matching. Expressions like [A-Z] will match lowercase letters,
                        too. This is not affected by the current locale.
re.L or re.LOCALE       Interprets words according to the current locale. Make alphabetic group (\w and \W),
                        word boundary (\b, \B), and \s and \S dependent on the current locale.
re.M or re.MULTILINE    When specified, the pattern character '^' matches at the beginning of the string and at the
                        beginning of each line (immediately following each newline); and the pattern character '$'
                        matches at the end of the string and at the end of each line (immediately preceding each
                        newline). By default, '^' matches only at the beginning of the string, and '$' only at the
                        end of the string and immediately before the newline (if any) at the end of the string.
re.S or re.DOTALL       Make the '.' special character match any character at all, including a newline; without
                        this flag, '.' will match anything except a newline.
re.U or re.UNICODE      Make \w, \W, \b, \B, \d, \D, \s and \S dependent on the Unicode character properties
                        database.
re.X or re.VERBOSE      This flag allows you to write regular expressions that look nicer and are more readable by
                        allowing you to visually separate logical sections of the pattern and add comments.
                        Whitespace within the pattern is ignored, except when in a character class or when preceded
                        by an unescaped backslash. When a line contains a # that is not in a character class and is
                        not preceded by an unescaped backslash, all characters from the leftmost such # through the
                        end of the line are ignored.
"""
# The following regular expression objects that match a decimal number are functionally equal
a = re.compile(r"""\d +  # the integral part
                   \.    # the decimal point
                   \d *  # some fractional digits""", re.X)
b = re.compile(r"\d+\.\d*")
