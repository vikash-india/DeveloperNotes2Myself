#######################################################################################################
# Description: Hash or Arrays
# Notes: 
#		1. 
#		2. 	
#######################################################################################################
 
 
my %HOfAAccountSummary;


$HOfAAccountSummary{"MF1"} = ["MF1", 1.1];
$HOfAAccountSummary{"MF2"} = ["MF2", 2.2];

push(@{ $HOfAAccountSummary{"MF2"} }, "new value");

print %HOfAAccountSummary;              # Print Address of arrays
print $HOfAAccountSummary{"MF2"};       # Print Address of a particular arrays
print @{$HOfAAccountSummary{"MF2"}};    # Prints content of an arrays
print $HOfAAccountSummary{"MF2"}[0];    # prints the particular cell of an arrays


foreach $string (keys %HOfAAccountSummary) {
    print "\n$string: @{$HOfAAccountSummary{$string}}"; 
} 