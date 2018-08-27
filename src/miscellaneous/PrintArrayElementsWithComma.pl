#######################################################################################################
# Description: Print Array using comma
# Notes: 
#       1. 
#       2.  
#######################################################################################################
my @array = (1,2,3,4,5,6,7,8,9,0);

print @array;   # By Default it is space
print "\n";

#Method 1
print join( ',', @array );
print "\n";

#Method 2
local $, = ',';     #You should make your assignment to $, temporary by doing 
$, = ',';           #$, is the output field separator: print will insert whatever string has been assigned to $, between all of its arguments.
print @array;
print "\n";

# Many more methods at http://www.perlmonks.org/?node_id=30279