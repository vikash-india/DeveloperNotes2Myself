# Description: This program explains the basic Standard IO

$a = <STDIN>;       # Reads up to a newline, or whatever you've set the variable $/ to.
@a = <STDIN>;       # Evaluating in a list context produces all remaining lines as a list.
                    # Each element is one line, including its terminating newline.

print $a;
print @a;

# Another example
while (defined($line_ = <STDIN>)) {     # As long as a line has been read in, <STDIN> evaluates to
                                        # a defined value otherwise undef
    # process $line_ here
}

# Reading a scalar value from <STDIN> into $_ and using that value as the
# controlling expression of a loop
while (<STDIN>)	{   # like "while(defined($_ = <STDIN>_)"
    chomp;		    # like "chomp($_)"
    # ... and other operations with $_ here
}

# The operator <> works like <STDIN>. It returns a single line in a scalar context
# (undef if all the lines have been read)
while (<>) {
    print $_;
}

# Note:
# 1. If invoked as "perl Sample.pl file1 file2 file3" then it will list out the contents
#    of each file. If you don't specify any filenames on the command line, the diamond operator
#    reads from standard input automatically.
# 2. Technically, the diamond operator isn't looking literally at the command-line arguments;
#    it works from the @ARGV array. This array is a special array initialized by the Perl
#    interpreter to the command-line arguments.
# 3. You can even set this array within your program and have the diamond operator work on that
#    new list rather than the command-line arguments
