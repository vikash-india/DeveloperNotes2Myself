###################################################################################################
# Description: Regular expression SUBSTITUION in Perl: Searches and replaces a regular expression
#              with another STRING in a string.
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

# Example 1:
$string = "xyzabcpqrABCxxxxx";
$regExpression	= "VIKASH";
$replaceString	= "112233";

print $_."\n";

if ($string =~ s/$regExpression/$replaceString/i) {
    print "Result				: FOUND\n";
    print "New String			: $string\n";
    print "String Before Regex	: $`\n";
    print "Regex				: $&\n";
    print "String After Regex	: $'\n";
} else {
    print "Result				: NOT FOUND\n";
    print "Original String		: $string\n";
    print "String Before Regex	: $`\n";
    print "Regex				: $&\n";
    print "String After Regex	: $'\n";
}

# Example 2: A simple example
$_ = "xyzabcpqrABCxxxxx";
print $_."\n";

if (s/abc/112233/ig) {
    print "$_\n";
} else {
    print "Not Found\n";
}
