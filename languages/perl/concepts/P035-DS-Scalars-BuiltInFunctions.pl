# Description: This program demonstrates some of the scalar functions available in perl

$variable_1 = "Hello World\n";
chop($variable_1);			   	     # Removes the last character
chomp($variable_1);				     # Removes the last character ONLY IF it is a newline

chr(65);						     # Returns "A"

$position = -1;

# Starts from the beginning
$position = index("Dendrite ODC for Dendrite Inc" , "Dendrite");
print "Found at $position\n";

# Starts from the position
$position = index("Dendrite ODC for Dendrite Inc" , "Dendrite", $position + 1);
print "Found at $position\n";

# Extrapolation of Scalars into Strings
$variable_2 = "World";
$variable_3 = "Hello $variable_2";	 # To avoid extrapolation, either single quotes should
                                     # be used or $ should be escaped.
print "$variable_3\n";







