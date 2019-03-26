#######################################################################################################
# Description: This examples explains how to create hashes of arrays
# Notes: 
#		1.  
#			
#######################################################################################################
 
my %HashOfArrays = 
(
	"Purchase"			=> ["Purchase", "1"],
	"Div. Reinvestment" => ["Dividend Reinvest", "6"]
);

print $HashOfArrays{Purchase}->[0]."\n";
print $HashOfArrays{"Div. Reinvestment"}->[0]."\n";