# Description: This script explains how to read from a file

# All forms of open return true for success and false for failure.
open(IN, "026-Addresses") || die "Error open: $!";      # For reading from the file

# Read the content
while (<IN>) {
    chomp;
    print "I saw $_ in some_file!\n";
}

close(IN);