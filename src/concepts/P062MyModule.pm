# Description: Creating a module in Perl.
# Note: This file is used in the script "051-Modules-AccessingModule.pl"
# TODO: Expand on module

package MyModule;

use 5.008006;
use strict;
use warnings;

sub hoot {
    my $self = shift;
    print "Inside MyModule\n";
    print "Arguments Passed: $self\n";

    return "All is Well!\n";
}

1;
