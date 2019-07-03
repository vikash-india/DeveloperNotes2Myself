# Description: Raw Strings

if __name__ == '__main__':
    # Escape characters are honoured
    a_string = "this is\na string split\t\tand tabbed"
    print(a_string)

    # Raw string is printed as it is without interpreting the escape characters.
    # This is used a lot in regular expressions
    raw_string = r"this is\na string split\t\tand tabbed"
    print(raw_string)

    b_string = "this is" + chr(10) + "a string split" + chr(9) + chr(9) + "and tabbed"
    print(b_string)

    backslash_string = "this is a backslash \followed by some text"
    print(backslash_string)

    backslash_string = "this is a backslash \\followed by some text"
    print(backslash_string)

    error_string = r"this string ends with \\"
