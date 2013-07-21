# Description: This program explains various  looping control keywords

# Different ways to control a loop, All these are equivalents
if ( !open(FOO) ) { die "Can't open $FOO: $!" }
die "Can't open $FOO: $!" unless open(FOO);
open(FOO) || die "Can't open $FOO: $!";
open(FOO) ? () : die "Can't open $FOO: $!";

# next
LINE: while (<STDIN>) {
    next LINE if /^#/;      # discard comments
    # Perl accepts an ellipsis, "... ", as a placeholder for code that you haven't implemented yet.
    ...
}

# last: Exits the loop. The continue block, if any, is not executed
LINE: while (<STDIN>) {
    last LINE if /^$/;      # exit when done with header
    ...
} continue {
    # Wont be executed
    ...
}

# redo: Restarts the loop block without evaluating the conditional again.
# The continue block, if any, is not executed.
while (<>) {
    chomp;
    if (s/\\$//) {
        $_ .= <>;
        redo unless eof();
    }
    # now process $_
} continue {
    # Wont be executed
    ...
}
