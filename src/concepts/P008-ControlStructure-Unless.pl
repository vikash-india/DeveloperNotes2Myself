# Description: This program explains the control structure - unless

# Sometimes, you want to leave off the then part and have just an else part, because
# saying "do that if this is false," is more natural than saying "do that if not this is true."
# Perl handles this case with the unless variation

$string = "Larry Wall";
unless($string ne "Larry Wall")	{   # This condition should be FALSE
    print "He is not the founder of PERL Language!\n";
}
