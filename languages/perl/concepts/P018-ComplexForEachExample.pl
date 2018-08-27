# Description: A complext foreach example which explains that changing the value of the loop
# variable changes the arrays as well. Difficult to understand this kind of code.

# Notice how altering $one in fact altered each element of @a.
@a = (3, 5, 7, 9);
foreach $one (@a) {
    $one *= 3;

    $x = 17;
    @a = (3, 5, 7, 9);
    @b = (10, 20, 30);
    foreach $one (@a, @b, $x) {
        $one *= 3;
    }
    # $x is now 51
    # @a is now (9,15,21,27)
    # @b is now (30,60,90);
}

# @a is now (9,15,21,27)
print @a;