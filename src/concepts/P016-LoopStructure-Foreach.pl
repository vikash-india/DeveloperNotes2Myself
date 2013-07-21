# Description: This program explains a looping structure - foreach

# Example 1
@array_1 = (1, 2, 3, 4, 5);
foreach $var_1 (@array_1) {
    print "Value of the variable is $var_1\n";
}

# Example 2
@array_2 = ("AAA", "BBB", "CCC", "DDD");
foreach $var_1 (reverse(@array_2)) {
    print "Value of the variable is $var_1\n";
}
print "@array_2\n\n";	        # The original values are not modified by the reverse function

# Example 3
foreach (reverse(@array_2)) {   # The variable name can be ommited and in this case $_ stores the value
    print "Value of the variable is $_\n";
}

# Example 4
foreach (@array_2) {
  print;					    # by Default print takes $_ as the value to be printed
}

# Example 5
print "\n";
foreach (@array_2) {			# The variable name can be ommited and in this case $_ stores the value
  print;
  pop(@array_2);			    # If the array is chaged inside the loop then the value of the loop
                                # also gets affected
}