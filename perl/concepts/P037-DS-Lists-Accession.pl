# Description: Different ways of accessing arrays in Perl

@array_1 = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);			# Sample Array
$index = 2;

$var1 = $array_1[9];								# Accessing the 10th element of the array. Perl
                                                    # provides a traditional subscripting operator
                                                    # to access an array element by numeric index
$array_1[9]++;										# Incrementing the 10th element of the array
                                                    # making it 11
$array_1[9] += 4;									# Adding 4 to the 10th element of the array and
                                                    # making it 15
($array_1[0], $array_1[9]) = ($array_1[9], $array_1[0]); # Swapping the first and the last
                                                    # element of the array
@array_1[0, 1] = @array_1[1, 0];					# Same as above. Swaps the first two elements
($var2, $var3) = @array_1[0,1];						# Same as ($array_1[0],$array_1[1])
@array_1[0, 1, 2] = @array_1[1, 1, 1];				# Makes the first three elements same as the
                                                    # second
@array_1[1, 2] = (9, 10);							# Change the value of the second and third
                                                    # element of the array
@array_2 = (qw(Mickey Donald Garfield))[1, 2];		# Slicing from Array Literals
$var4 = $array_1[($index-1) * 2];					# Array index can be an expression also.
$var5 = $#array_1;									# To know the last index of an array
$var6 = $array_1[$#array_1];						# To access the last element
$var6 = $array_1[-1];								# Another way to access the last element.
                                                    # A negative subscript on an array counts back
                                                    # from the end. So, another way to get at the
                                                    # last element is with the subscript -1. The
                                                    # second to the last element would be -2, and
                                                    # so on.

# A complex example
@array_3 = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);  		# Sample Array
@array_4 = @array_3[0..5];							# Assigns a range of values from the array
print $array_4[5];

# Printing the above arrays
print "@array_1[1]\n";
#print "@array_2\n";
#print "$var4\n";
