# Description: This program explains how to write to Standard Output

$a = print("hello ", "world", "\n");    # The return value of print is a true or false value,
                                        # indicating the success of the print

# Sometimes you need to use parenthesis
print (2 + 3), "hello\n";               # Wrong! prints 5, ignores "hello"
print((2 + 3), "hello\n");              # Right, prints 5hello
print 2+3,"hello\n";                    # Also Right, prints 5hello

printf "%15s %5d %10.2f\n", $string, $number, $real;
# Similarly sprintf() functions prints to an array
