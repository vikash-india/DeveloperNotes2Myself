# Description: Hash creations in Perl

$hash_1{"aaa"} = "bbb";					# Creates key "aaa", value "bbb"
$hash_1{234.5} = 456.7;					# Creates key "234.5", value 456.7

print $hash_1{"aaa"};					# Prints "bbb"
$hash_1{234.5} += 3;					# Makes it 459.7

# Note:
# 1. Perl doesn't really have a literal representation for a hash, so instead it unwinds
# the hash as a list. Each pair of elements in the list (which should always have an
# even number of elements) defines a key and its corresponding value.
# 2. This unwound representation can be assigned into another hash, which will then
# recreate the same hash.
# 3. The order of the key-value pairs is arbitrary in this unwound representation
# cannot be controlled. Even if you swap some of the values around and create the hash
# as a whole, the returned unwound list is still in whatever order Perl has created for
# efficient access to the individual elements. You should never rely on ordering

@array_1 = %hash_1;						# @array_1 gets ("aaa", "bbb", "234.5", 456.7)
%hash_2 = @array_1;						# Create %hash_2 like %hash_1
%hash_2 = %hash_1;						# A faster way to do the same
%hash_3 = ("aaa","bbb","234.5",456.7);  # Create %hash_3 like %hash_1, from literal values

# One quick use of this winding and unwinding is to copy a hash value to another hash variable:
%copy = %original;                      # Copy from %original to %copy

# You can construct a hash with keys and values swapped using the reverse operator,
# which works magically well here.
%backwards = reverse %normal;

# Of course, if %normal has two identical values, those will end up as only a single element
# in %backwards, so this swap is best performed only on hashes with unique keys and values.
