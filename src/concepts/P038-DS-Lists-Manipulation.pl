# Description: Manipulating Arrays in Perl

@array1 = (1, 2, 3);								# Sample Array
@array2 = (99, 199, 299);							# Sample Array

$string = "Hello";								    # Sample String

@array1 = (100, @array1);						    # Inserting 100 in front of an array
@array1 = (@array1, 200);						    # Inserting 200 in the end of an array
@array3 = (@array1, 300, 400, $string, @array2);    # A new array can be created from
                                                    # an existing array
($var1, $var2, $var3) = (1, 2, 3);				    # Multiple scalars can be assigned in
                                                    # a single statement
($var4, @array4) = (1, 2, 3, 4, 5);				    # Arrays and Scalars can also be assigned
                                                    # in a single statement
($var5, @array4) = @array4;						    # remove the first element of @array4 and
                                                    # puts it in $var5. Hence @array4 = (3, 4, 5)
@array5 = (@array6 = (1, 2, 3));					# @array5 and @array6 is (1, 2, 3)
@array7 = @array8 = (1, 2, 3);					    # Same thing as above.

$var6 = @array8;								    # Scalar Context. $var6 = length of array8
($var7) = @array8;								    # List Context. $var7 = first element of array8

# Printing the above arrays
print "$var6\n";
print "$var7\n";
