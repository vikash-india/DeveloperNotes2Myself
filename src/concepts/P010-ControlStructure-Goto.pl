# Description: This program explains the control structure - when
# Note:
# 1. Use of goto-LABEL or goto-EXPR to jump into a construct is deprecated & will issue a warning.

# Form 1: goto LABEL
# 1. A goto in this form cannot be used to jump into a loop or external function.
# 2. You can only jump to a point within the same scope.
my $count = 0;

START:
$count = $count + 1;
if( $count > 4 ) {
    print "Exiting program\n";
} else {
    print "Count = $count, Jumping to START:\n";
    goto START;
}
# Form 2: goto EXPR
$i = 1;
goto ("FOO", "BAR")[$i];
goto ("FO")."O";

FOO:
print "FOO";
exit (1);

BAR:
print "BAR";
exit (2);

# Form 3: goto &NAME
# TODO

