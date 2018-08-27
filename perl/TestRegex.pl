#######################################################################################################
# Description: Searches for a regular expression in a data file.
# Notes:
#		1. Syntax
# 				$String =~ m|s/RegExpr/$ReplaceString/ig
#			where
#				$String			: String to be Searched
#				m|s				: Search/Substitute
#				RegExpr			: Regular Expression
#				$ReplaceString	: Replace String
#				i				: Ignoring Case
#				g				: Global pattern Matche
#		2. Special Variables
#				$1, $2 returns the remembered match patterns \1, \2 etc
#				$` returns the string before the matched regex
#				$& returns the matched regex
#				$' returns the string after the matched regex
#		3. New regex delimiter like @ or # can be used instead of default / by giving it just after m|s
#######################################################################################################

regexFromString();
#regexFromFile();
exit(0);

# Example 1: For Simple Regex Checks
sub regexFromString {
    my $string       = "Test";
    my $regExPattern = '^(INFO|WARN|ERROR)\s(.*)';
    print "Example 1: Regex Result\n";
    if ( $string =~ /$regExPattern/ ) {
        print "1 = $1\n";
        print "2 = $2";
    }
    else {
        print("Not Found\n");
    }
}

# Example 2: For Regex checks from a file
sub regexFromFile {
    print "\nExample 2: Regex from Script Result\n";

    # Read from String
    #my $c = '<td align="left" valign="top" style="padding-left:7px;">Tier Type</td>';

    # Or Read from File: Open the data file and read the entire content in a string
    my $fileName = "script_support/359489-PranStatus/output3.html";
    open( FILE, $fileName ) or die "Could not open file: $!";
    my $c = join( "", <FILE> );
    close FILE;

    #print $c."\n";

    if ( $c =~ m/PRAN.*?\[Status:(.*?)\]/is ) {
        print ".$1.";

        $pran_status = $1;
        $pran_status =~ s/\s+//g;
        print ".$pran_status.";
    }
    else {
        print "NOT Found\n";
    }
}