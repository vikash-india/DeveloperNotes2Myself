# Description: Interpolation of an array in Perl

@array_1 = ("Hello", "World", "Dendrite", "India"); # Sample Array
$index = 2;
$var_1 = "I am saying $array_1[0] to you";			# Interpolating
                                                    # "Hello"
$var_2 = "I am saying $array_1[$index - 2] to the whole $array_1[$index - 1]";  # Interpolating 0th &
                                                                                # 1st element

# Interpolating the complete array values
$var_3 = "This is complete array: @array_1";

# Interpolating a portion of an array with a slice
$var_4 = "Slice of an array: @array_1[2, 3]";

# Interpolating simple scalar variable using square bracket and index
@array_1 = ("Hello","World");                       # Sample Array
$array_1 = "Mickey";						        # we are trying to say "this is Mickey[1]"
$var_5 = "This is $array_1[1]";				        # WRONG, gives "this is Mickey"
$var_5 = "This is ${array_1}[1]";			        # Right (protected by braces)
$var_5 = "This is $array_1"."[1]";			        # Right (different string)
$var_5 = "This is $array_1\[1]";			        # Right (backslash hides it)

# printing the values of the above interpolation
print $var_1."\n";
print $var_2."\n";
print $var_3."\n";
print $var_4."\n";
print $var_5."\n";
