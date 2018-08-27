# Description: This program explains how to create user defined functions and call them

# Function Definition
sub say_hello {
    print "Hello World\n";

    return 2 + 3;
    # return (2, 3, 4);	# This should be collected in an array / list
}

# Invoking a sub routine
say_hello();			# Calling a function
$a = 3 + say_hello();	# Calling a function from an expression

# Invoking a sub routine with arguments
# Notes:
# 1. All argument values are stored in a special variable @_
# 2. The @_ variable is private to the subroutine. If there's a global value for @_,
#    it is saved away before the subroutine is invoked and restored to its previous
#    value upon return from the subroutine.
# 3. This also means that a subroutine can pass arguments to another subroutine
#    without fear of losing its own @_ variable; the nested subroutine invocation
#    gets its own @_ in the same way.
sub say_hello_to {
  print "Hello, $_[0]!\n"; # Excess parameters are ignored here
}

# Invoking with arguments
say_hello_to ("Scrat");

# Private Variables in Functions
sub add {
    my $sum;         # make $sum a local variable
    $sum = 0;        # initialize the sum

    foreach $_ (@_) {
        $sum += $_;  # add each element
    }

    # Variables can have many nested local versions, although you can access only one at a time.
    return $sum;     # Last expression evaluated
}

# Semiprivate Variables Using local
$value = "original";
foo();
spoof();
foo();

sub spoof {
    local ($value) = "temporary";
    foo();           # But with local, variable is also available within any subroutines
                     # called from spoof().
}

sub foo {
    print "Current value is $value\n";
}
