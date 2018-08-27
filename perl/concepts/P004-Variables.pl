# Description: This program explains how to create and use variables

# Float Literal
$float_var = 1.25;						# Float Variable
$integer_var = -2004;					# Integer Literal
$octal_var = 0234;						# Octal Number. Octal numbers starts with 0 (Zero)
$hexa_var = 0x1A;						# Hexadecimal Number. Hexa numbers starts from 0x or OX (Zero followed by x or X)
$string_var = "Perl Rocks!";			# String Variable

print "Float: $float_var\n";
print "Integer: $integer_var\n";
print "Octal: $octal_var\n";            # While printing, it prints the decimal value.
print "Hexadecimal: $hexa_var\n";       # While printing, it prints the decimal value.
print "String: $string_var\n";

# To print in Octal & Hexadecimal format
$oct_string = sprintf "%lo", $OctalVar1;
$hex_string = sprintf "%lx", $HexaVar1;
print $oct_string."\n";
print $hex_string."\n";