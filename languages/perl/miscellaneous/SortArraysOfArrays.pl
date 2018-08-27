#######################################################################################################
# Description: Sorting an array of arrays based on the date
# Notes: 
#		1. Convert the date DD/MM/YYYY into a number of form YYYYDDMM and compare them numerically
#		2. Use the technique to sort an arrays of arrays to sort	
#######################################################################################################
 
my $date1 = "20/01/2008";
my $date2 = "20/09/2008";

# Convert the date to a number
$date1 =~ m/(..)\/(..)\/(....)/;
my $newDate1 = $3.$1.$2;

$date2 =~ m/(..)\/(..)\/(....)/;
my $newDate2 = $3.$1.$2;

print "NewDate1: $newDate1\n";
print "NewDate2: $newDate2\n";

# Create Arrays of Arrays
my @AoA = 
(
           [ $newDate2, "barney" ],
           [ $newDate1, "jane"]
);

# Add another element into the array
push @AoA, [ $newDate2-5, "Pushed" ];

# Sort it
for $list_ref ( sort { $a->[0] <=> $b->[0] } @AoA ) {
    print "@$list_ref\n";
	# print "@$list_ref[1]\n"; # For accessing each of the elements in the Array of Arrays
} 


    
 