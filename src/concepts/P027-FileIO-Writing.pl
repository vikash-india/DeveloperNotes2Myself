# Description: This code snippet explains how to write to a file

# All forms of open return true for success and false for failure.
open(OUT, ">Outfile.txt");	         # For writing the file.
                                     # Operator > overwrites the file if it exists.

print OUT "Hello World Line 1\n";
print OUT "Hello World Line 2\n";

close(OUT);