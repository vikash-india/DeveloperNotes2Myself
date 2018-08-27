# Description: This program explains various string operators available in Perl

$string_1 = "Hello"."World";			# Concatenation Operators
$string_2 = 'hello world' . "\n";		# Same as string_1
$string_3 = "fred" . " " . "barney";	# Same as "fred barney"

# String comparison operators
$string_4 = "Hello";
$string_5 = "Hello";
if($string_4 eq $string_5) {            # String comparison operators are eq, ne, lt, gt, le, ge
    print "Equal\n";
} else {
    print "Not Equal\n";
}

# String repetition operators
$string_6 = "fred" x 3;					# is "fredfredfred". Note the 'x' character and not 'X'
$string_7 = "barney" x (4 + 1);			# is "barney" x 5, or "barneybarneybarneybarneybarney"
$string_8 = (3 + 2) x 4;				# is 5 x 4, or really "5" x 4, which is "5555"

print "\"fred\" x 3 = $string_6\n";
print "\"barney\" x (4 + 1) = $string_7\n";
print "(3+2) x 4 = $string_8\n";

# Other Operators
$string_9 = "Hello";
$string_9 .= " World";

print "Binary Concatenation Operator = $string_9\n";