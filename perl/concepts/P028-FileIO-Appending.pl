# Description: This script explains how to append to a file instead of overwriting the file.

# All forms of open return true for success and false for failure.
open(OUT, ">>Outfile.txt");         # For appending to a file
                                    # Operator >> appends to the end of an existing file.

print OUT "Appending 1: Hello World Line 3\n";
print OUT "Appending 2: Hello World Line 4\n";

close(OUT);