# Description: Different built-in functions available for lists

@array_1 = (5, 6, 7, 8, 9);			# Sample array

# Right side of the array functions
push(@array_1, 10);					# Adds 10 at the end of the array.
                                    # Same as @array_1 = (@array_1,10).  The pop() function returns
                                    # undef if given an empty list.
push(@array_1, 11, 12, 13, 14);		# Adds a list to the array. Now array_1 = (5, 6, 7, 8, 9,
                                    # 10, 11, 12, 13, 14)
$poppedValue = pop(@array_1);		# Removes the last element of @array_1 & returns the
                                    # removed element

# Left side of the array functions
unshift(@array_1, 10);				# Adds 10 at the beginning of the array.
                                    # Same as @array_1 = (10,@array_1);
unshift(@array_1, 20, 30, 40);		# Adds 20, 30, 40 to the beginning of the array.
                                    # Same as @array_1 = (20,30,40,@array_1)
$var1 = shift(@array_1);			# Removes the first element of the array.
                                    # Same as ($var1, @array_1) = @array_1;
                                    # As with pop(), shift() returns undef if you give it
                                    # an empty array variable.

# Deleting elements from a list
@array_1 = (1, 2, 3, 4, 5);         # Sample array
delete(@array_1[1..3]);             # Delete function
print @array_1;

# Reversing an array
@array_1 = (1, 2, 3, 4, 5);			# Sample array
@array_2 = reverse(@array_1);		# Reverses the content of the array. Please note that the
                                    # argument list is unaltered; the reverse() function works
                                    # on a copy.
@array_1 = reverse(@array_1);		# If you want to reverse an array "in place," you'll need
                                    # to assign it back into the same variable
@array_3 = reverse(5, 6, 7, 8, 9);	# Works on list of literals as well

# Sorting an array: Sorts them as if they were single strings in ascending ASCII order
@array_1 = (3, 14, 5, 7, 95);		# Sample array
@array_4 = sort(@array_1);			# After sorting it will have 14 3 5 7 95 because it sorts
                                    # them in ascending order of ASCII values

@array_1 = qw(A, D, d, 1, World);	# Sample array
@array_4 = sort(@array_1);			# After sorting it will have A, D, d, 1, World

# TODO: Numerical Sort example
# TODO: Advanced Sorting like sort based on third character in the array in descending order.

# Chomp function
@array_5 = ("hello\n",
            "world\n",
            "happy days");			# Sample array
chomp(@array_5);					# @array_5 is now ("hello","world","happy days")

# print the above array values
print "@array_5\n";
print "$poppedValue\n";
