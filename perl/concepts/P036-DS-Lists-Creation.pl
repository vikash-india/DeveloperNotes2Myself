# Description: Creating Arrays in Perl

$var1 = 100;
$var2 = 105;
$string = "Hello";

# Array List
@array1  = ();									    # the empty list (zero elements)
@array2  = (1, 2, 3);								# array of three values 1, 2, and 3
@array3  = ("fred", 4.5);						    # two values, "fred" and 4.5
@array4  = ($var1, $string);						# two values which comes from a variable
@array5  = (1..5);								    # same as (1, 2, 3, 4, 5)
@array6  = (1.2..5.2);							    # same as (1.2, 2.2, 3.2, 4.2, 5.2)
@array7  = (2..6, 10, 12);						    # same as (2,3,4,5,6,10,12)
@array8  = ($var1..$var2);						    # range determined by current values of
                                                    # $var1 and $var2
@array9  = (1.3..6.1);							    # same as (1.3, 2.3, 3.3, 4.3, 5.3). If the
                                                    # final value is not a whole number of steps
                                                    # above the initial value, the list stops just
                                                    # before the next value would have been outside
                                                    # the range
@array10 = (4.1..2.3);						    	# Same as () list. Having the right scalar less
                                                    # than the left scalar results in an empty list;
                                                    # you can't count down by switching the order
                                                    # of the values.
@array11 = ("fred", "barney", "betty", "wilma");    # Looks ugly due to lots of quotes
@array12 = qw(fred barney betty wilma);			    # Same thing as above but looks better
@array13 = qw(
        fred
        barney
        betty
        wilma
);												# Same thing but much better now

# Printing the above arrays
print "@array12\n";
print "$array12[1]\n";
