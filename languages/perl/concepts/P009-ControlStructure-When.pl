# Description: This program explains the control structure - when
# Note:
# 1. These when keywords related is to the experimental switch feature proposed for Perl 6
# 2. Starting from Perl 5.10, you can say, 'use feature "switch";' or 'use v5.10.1;', which enables a
#    switch feature that is closely based on the Perl 6 proposal.

#use feature "switch";
use v5.10.1;

my $i = 1;

my $x = $y = $other = 0;
given ($i) {
    $x = $i when $i == 1;
    $y = $i when $i == 2;
    $other  = $i;
}
print "i = $i, x = $x, y = $y other = $other";
