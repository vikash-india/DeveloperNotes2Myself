# Description: This program explains the control structure - if-else, if-elsif-else

$var_1 = 2;

# Single if-else
if ($var_1 == 2) {   # Curly braces are required even if the statement is single line statement.
                     # This is to avoid confusing dangling else	problem
    print "Equal\n";
} else {
    print "Not Equal\n";
}

# if-elsif-else
if ($var_1 == 2) {
    print "Equal to 2\n";
} elsif ($var_1 == 3) {
    print "Equal to 3\n";
} elsif ($var_1 == 4) {
    print "Equal to 4\n";
} elsif ($var_1 == 4) {      # This block wont get executed as the previous one will get executed and
                            # rest of the blocks will be skipped.
    print "Equal to 2nd block for matching 4\n";
} else {
    print "Not Equal to 2, 3, 4\n";
}
