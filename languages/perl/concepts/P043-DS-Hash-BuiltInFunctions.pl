# Descriptions: Built In Hash functions

# The keys Function: The keys(%hashname) function yields a list of all the current keys
# in the hash %hashname. In other words, it's like the odd-numbered (first, third, fifth, etc.)
# elements of the list returned by unwinding %hashname in an array context.
$hash_1 {"aaa"} = "bbb";
$hash_1 {234.5} = 456.7;

@array_1 = keys(%hash_1);					   # @array_1 gets ("aaa", 234.5) or (234.5, "aaa").
                                               # No guarantee of ordering within a hash

# Looping using keys
foreach $key (keys %hash_1) {				   # Once for each key of %hash_1
    print "at $key we have $hash_1{$key}\n";   # show key and value
}

# In a scalar context, the keys function gives the number of elements (ie key-value pairs)
# in the hash. For example, you can find out whether a hash is empty:
if (keys(%hash_1)) {                           # if keys() not zero:
    print "Hash not empty\n" ;
}

# In fact, merely using %somehash in a scalar context will reveal whether the hash is empty or not.
if (%hash_1) {                                 # if true, then something's in it
    print %hash_1;
}

$counter = 1;
while (keys(%hash_1) < 10) {
    print "\nValue is  ".keys(%hash_1);        # Keep looping while we have less than 10 elements
    $hash_1 {$counter} = $counter;
    $counter++;
}

# The values Function: The values(%hashname) function returns a list of all the current values
# of the %hashname, in the same order as the keys returned by the keys(%hashname) function.
%hash_2 = ();					               # Force %lastname to be empty
$hash_2{"Mickey"} = "Mouse";
$hash_2{"Donald"} = "Duck";
@array_2 = values(%hash_2);		               # Grab the values. @array_2 contains
                                               # either ("Mouse", "Duck") or ("Duck", "Mouse").

# The each Function:
# 1. A more efficient way to iterate over a hash is to use each(%hashname), which returns
# a key-value pair as a two-element list.
# 2. When there are no more pairs, each returns an empty list.
# 3. Assigning a new value to the entire hash resets the each function to the beginning.
# Adding or deleting elements of the hash is quite likely to confuse each
while (($first, $last) = each(%hash_1)) {
    print "The last name of $first is $last\n";
}

# The delete Function
%hash_3 = ("aaa", "bbb", 234.5, 34.56);        # give %hash_3 two elements
delete $hash_3{"aaa"};                         # %hash_3 is now just one key-value pair

# Hash Slices
$score{"fred"} = 205;
$score{"barney"} = 195;
$score{"dino"} = 30;

# This collection seems rather redundant, and in fact can be shortened to:
($score{"fred"}, $score{"barney"}, $score{"dino"}) = (205,195,30);

# But even these seem redundant. Let's use a hash slice instead
@score{"fred", "barney", "dino"} = (205, 195, 30);

# We can use a hash slice with variable interpolation as well
@players = qw(fred barney dino);
print "scores are: @score{@players}\n";

# Hash slices can also be used to merge a smaller hash into a larger one.
# In this example, the smaller hash takes precedence in the sense that if there are duplicate keys,
# the value from the smaller hash is used
@league{keys %score} = values %score;

# Here, the values of %score are merged into the %league hash. This operation is equivalent
# to the much slower operation
%league = (%league, %score);                   # merge %score into %league
