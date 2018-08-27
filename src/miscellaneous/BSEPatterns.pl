#######################################################################################################
# Description: Creates NSE or BSE Names according to Perfios Standard  
# Notes: 
#######################################################################################################
use strict;

my $orignalString = 'Leader Packaging';

my $string = $orignalString;

# Rule: No Special Character
$string =~ s/[\)\(]//g;

# Rule: No Periods
$string =~ s/\./ /g;                # Replace Periods with Space

# Rule: Ltd.
$string =~ s/(LIMITED|LTD)/Ltd./ig;

# Rule: India for I
$string =~ s/ I /India/g;

# Rule: Capitalization
$string  =~ s/(\w+)/\u\L$1/g;

# Rule: Trim Spaces
$string =~ s/ *$//;                 # Remove Trailing Spaces
$string =~ s/^ *//;                 # Remove Leading Spaces
$string =~ s/\s+/ /g;               # Remove Multiple Spaces with a single Space
$string =~ s/ ([^&]) /$1/;          # Bring Single Characters Together except & 

# Final Output
print "Original String\t: $orignalString\n";
print "After Cleanup\t: $string";
if($orignalString eq $string) 
{
	print "\nNo Cleanup Required\n";
} 

