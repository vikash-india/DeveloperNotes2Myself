###################################################################################################
# Description: Regular expression SEARCH in a FILE: Searches for a regex in a data file.
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
#		3. New regex delimiter like @ or # can be used instead of default / by giving it just
#          after m|s
###################################################################################################
# A simple example
open(IN, "P082-RegEx-SampleData.txt") || die "Could not open file: $!";

# Find all the lines containing a particular string.
print "Looking for abc\n";
while (<IN>) {
  print "----------------------------------------------------\n";
    if (/abc/) {
        print "Original String      : $_";
        print "Result               : FOUND\n";
        print "String Before Regex  : $`\n";
        print "Regex                : $&\n";
        print "String After Regex   : $'";
    } else {
        print "Result               : NOT FOUND\n";
        print "Original String      : $_";
    }
}

# Close the file
close(IN);
