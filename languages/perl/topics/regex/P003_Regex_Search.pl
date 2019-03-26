###################################################################################################
# Description: Regular Expression SEARCH in Perl: Searches for a regular expression in a string
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
#       4. $_ is the default string where regex is applied if $String is not given.
###################################################################################################

# Sample String Data
$string = "A,b,c,d,e\,f,g,h,i,j,k";

# Example 1
$regExpression = "(?<=[e]),";

if ( $string =~ /$regExpression/ ) {
    print "Result				: FOUND\n";
    print "Original String		: $string\n";
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

# Example 2: Using string in special variable $_
$_ = "xyzabcpqr";
if (/abc/i) {
    print "Found\n";
} else {
    print "Not Found\n";
}
