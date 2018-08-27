# Description: This program demonstrates different types of Strings

# Single Quoted Strings
$string1  = 'hello';			# five characters: h, e, l, l, o
$string2  = 'don\'t';			# five characters: d, o, n, single quote, t
$string3  = '';					# the null string (no characters)
$string4  = 'silly\\me';		# silly, followed by backslash, followed by me
$string5  = 'hello\n';			# hello followed by backslash followed by n. Note that
                                # the \n within a single-quoted string is not interpreted as a
                                # newline, but as the two characters backslash and n. (Only
                                # when the backslash is followed by another backslash or a single
                                # quote does it have special meaning.
$string6  = 'hello there';		# hello, newline, there (11 characters in all) \n is interpreted
                                # as newline because of the double quotes.

# Double Quoted Strings
$string7  = "hello world\n";	# hello world, and a newline
$string8  = "new \007";			# new, space, and the bell character (octal 007)
$string9  = "coke\tsprite";		# a coke, a tab, and a sprite
$string11 = "c:\temp";			# WRONG - this string contains a c:, a TAB, and emp
$string10 = "c:\\temp";			# c:, backslash, and temp. This needs to be escaped

print ("Single Quoted String are\n");
print "$string1\n";
print "$string2\n";
print "$string3\n";
print "$string4\n";
print "$string5\n";
print "$string6\n\n";

# Special characters are interpreted inside a double quoted string.
print ("Double Quoted String are\n");
print "$string7\n";
print "$string8\n";
print "$string9\n";
print "$string10\n";
print "$string11\n";
