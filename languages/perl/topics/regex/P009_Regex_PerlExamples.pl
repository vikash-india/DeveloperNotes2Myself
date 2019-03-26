# Description: Various RegEx patterns in Perl
# TODO: Add all different patterns from the Jeffery / Pattern

$string_1 = "xyzabc";
$string_2 = "XYZAbC";
$string_3 = "xyza\nbc";
$string_4 = "AB-XYZ";
$string_5 = "Xyz12Ab";
$string_6 = "^";
$string_7 = "932434";

$reg_ex_pattern_1 = "a.";			# Matches any single character except newline (\n)
$reg_ex_pattern_2 = "[abcde]";		# Matches any of a, b, c, d, e
$reg_ex_pattern_3 = "[a-e]";		# Range operator
$reg_ex_pattern_4 = "[a-eA-E]";		# Case Insensitive
$reg_ex_pattern_5 = "[0-9\-]";		# Matches 0-9, or minus
$reg_ex_pattern_6 = "[a-zA-Z0-9_]"; # Matches any single letter, digit, or underscore
$reg_ex_pattern_7 = "[^0-9]";		# Matches any single non-digit
$reg_ex_pattern_8 = "[^\^]";		# Matches single character except an up-arrow
$reg_ex_pattern_9 = "^9|a";			# Matches 9 in the beginning or 'a' anywhere

$_ = $string_7;
if (/$reg_ex_pattern_7/) {
    print "Found in $_\n";
} else {
    print "Not Found in $_\n";
}
