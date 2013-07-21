# Description: Find out the regex engine type

# Regex Engine: Traditional NFA
# 1. Check if Lazy quantifiers are supported.  Regex 'nfa|nfa•not' when applied to string
#    'nfa•not' should ONLY match 'nfa'.
print "Testing for NFA Engine\n";
my $string = "nfa not";
if ($string =~ m/nfa|nfa not/g) {
    print "Match: $&\n";
    if ($& eq 'nfa') {
        print "Result: NFA Engine\n";
    } else {
        print "Result: Not an NFA Engine\n";
    }
} else {
    print "Match Not Found\n";
}


# Regex Engine: DFA
# 1. Capturing parentheses and backreferences are not supported by a DFA, but there are systems
#    that are a hybrid mix between the two engine types and hence can use DFA if there are no
#    capturing parentheses. Regex 'X(.+)+X' when applied to string  '=XX===================='
#    does NOT take long time to finish then it's a DFA engine (Note: It has been tested in the
#    previous step that it is not NFA)
#    Try in cygwin: echo =XX========================================= | egrep 'X(.+)+X'
print "Testing for DFA Engine\n";
my $string = "=XX====================";
if ($string =~ m/X(.+)+X/x) {
    print "Match: $&\n";
} else {
    print "Match Not Found\n";
}
print ("RESULT: If it is not NFA and if it took a long time then it is POSIX NFA otherwise it is DFA");
