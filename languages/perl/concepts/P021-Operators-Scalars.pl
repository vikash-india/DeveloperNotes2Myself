# Description: This program explains differnt scalar operators

# Unary Operators
$var_1 = +10;               # Unary Addition Operator
$var_2 = -10;               # Unary Subtraction Operator

# Basic Arithmetic Operators
$var_3 = 2 + 3;				# Addition Operators
$var_4 = 5.1 - 2.4;			# Subtraction Operators
$var_5 = 3 * 12;			# Multiplication Operator
$var_6 = 10.2 / 0.3;		# Division Operator. 10.2 divided by 0.3, or approximately 34
$var_7 = 10 / 3;			# Always floating point division, hence 3.333333...
$var_8 = 2 ** 3;    		# Exponentiation Operator (NOT available in C language)
$var_9 = 10 % 3;			# Modulus operator (Different from C)

# Bitwise Operators
$var_10 = ~1;               # Bitwise NOT.
$var_11 = 1 & 2;            # Bitwise AND. 01 & 10 = 00
$var_12 = 1 | 2;            # Bitwise OR. 01 | 10 = 11
$var_13 = 1 ^ 2;            # Bitwise XOR. 01 ^ 10 = 11. Odd count will make it 1.
$var_14 = 8 >> 2;           # Bitwise Right Shift. 8 >> 2 = 2
$var_15 = 8 << 2;           # Bitwise Left Shift. 8 << 2 = 32

# Short Circuit Logical Operator
# 1. Short Circuit Operators: !, &&, ||, not, and, or
# 2. ! is same as not, && is same as 'and' while || is same as 'or'
# 3. False Values: 0, '0', undef, '' (Empty scalar), () (Empty list), ('')
# 4. True Values: Everything else
my $var = '0';
if ($var and 1) {
    print("True\n");
} else {
    print("False\n");
}

# Auto Increment Operators
my $i = 0;
$result = ++$i;             # Pre Auto Increment Operator. $result is 1 and $i is 1
$result = $i++;             # Post Auto Increment Operator. $result is 1 and $i is 2
$result = --$i;             # Pre Auto Decrement Operator. $result is 1 and $i is 1
$result = $i--;             # Pre Auto Decrement Operator. $result is 1 and $i is 0
print("result = $result; i = $i\n");

# Numerical Relational Operators
$var_16 = 100;
if($var_16 == 100) {        # Aritmetic comparison operators are ==, !=, <, >, <=, >=
    print "Equal\n";
} else {
    print "Not Equal\n";
}

# String Relational Operators
$var_17 = "Hello";
if($var_17 ne "Hello") {    # String comparison operators are eq, ne, lt, le, gt, ge
    print "Equal\n";
} else {
    print "Not Equal\n";
}

# Assignment Operators
# 1. Assignment Operator: =
# 2. Mathematical Assignment Operator: += -= *= /= %= **=
# 3. Bitwise Assignment Operator: &= |= ^= >>= <<=
# 4. Logical Assignment Operator: != &&= ||=
# 5. String Assignment Operator: .= x=
$i = 'A';
$i x= 4;
print ("Assignment: $i\n");


# Range Operator
print (1 .. 4);
for (1 .. 5) {
    print;
    print "\n";
}

# Ternary Operator
$i = 1;
print (1 == 12 ? "Equal\n" : "Not Equal\n");

# Comma Operator
# 1. Binary ",", in scalar context, evaluates its left argument, throws that value away,
#    then evaluates its right argument and returns that value.
# 2. In list context, it's just the list argument separator, and inserts both its arguments
#    into the list. These arguments are also evaluated from left to right.
$i = 1, 2;  # Scalar Context
print ($i);
print 1, 2; # List Context
# 3. The => operator is a synonym for the comma except that it causes a word on its left to
#    be interpreted as a string if it begins with a letter or underscore and is composed only
#    of letters, digits and underscores.
my %h = ( FOO => 23 );

# Printing the output of Arithmetic Operators
print "2 + 3 = $var_3\n";
print "5.1 - 2.4 = $var_4\n";
print "3 * 12 = $var_5\n";
print "10.2 / 0.3 = $var_6\n";
print "10 / 3 = $var_7\n";
print "2 to the power of 3 = $var_8\n";
print "Remainder when 10 divided by 3 = $var_9\n";
print "var_11 = $var_11\n";

my $test = 1;
 $test &&= 1;
print "&&= $test"