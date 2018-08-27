# Description: Various data types in Perl

# 1.Perl has three built-in data types: scalars, arrays, hashes.


# Scalars
# 1. Scalar values are always named with '$', even when referring to a scalar that
#    is part of an array or a hash
# 2. A scalar value is interpreted as FALSE in the Boolean sense if it is undefined,
#    the null string or the number 0 (or its string equivalent, "0"), and
#    TRUE if it is anything else.
$days;                              # the simple scalar value "days"
$days[28];                          # the 29th element of array @days
$days{'Feb'};                       # the 'Feb' value from hash %days
$#days;                             # the last index of array @days

# Arrays: Arrays of scalars
# 1. Entire arrays (and slices of arrays and hashes) are denoted by '@', which works much as
#    the word "these" or "those" does in English. It indicates multiple values are expected.
@days;                              # ($days[0], $days[1],... $days[n])
@days[3,4,5];                       # same as ($days[3],$days[4],$days[5])
@days{'a','c'};                     # same as ($days{'a'},$days{'c'})

# Hashes: Associative arrays of scalars
# 1. Entire hashes are denoted by '%'
%days;                              # (key1, val1, key2, val2 ...)
