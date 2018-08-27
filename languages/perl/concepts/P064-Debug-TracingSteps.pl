# Description: Sample code to debug and trace steps

# Some variables
$x = 5;
$y = 42;

# Scalar and List with same name
@array_1 = (1, 2, 3, 4, 5);
$array_1 = 420;

# Some processing
$z = $x + $y;
print pop(@array_1)."\n";

# Some Output statement
print "Variable z is $z\n";
print "Variable z ^ 2 is " . $z * $z . "\n";

$return_value = MySubroutine(1, 2);
print "Value Returned: $return_value\n";

# A Subroutine
sub MySubroutine {
    print "Inside the subroutine\n";
    print "Parameters passed @_\n";

    return 99;
}
