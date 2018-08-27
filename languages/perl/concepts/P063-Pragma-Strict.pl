# Description: Perl pragma to restrict unsafe constructs

# Different strict types
use strict 'vars';          # Generates a compile-time error if you access a variable that
                            # was neither explicitly declared (using any of my, our, state,
                            # or use vars ) nor fully qualified
# use strict 'refs';        # Generates a runtime error if you use symbolic references
# use strict 'subs';
# use strict;               # With no import list, all the above restrictions are assumed.

# When strict 'var' is in force
$X::foo = 1;                # OK, Fully qualified
my $bar = 10;               # OK, my() var
#local $fubar = 9;          # Blows up, $fubar not declared before

print "$X::foo \n";
print "$bar \n";
#print "$fubar \n";




