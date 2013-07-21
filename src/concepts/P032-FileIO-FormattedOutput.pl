# Description: This script explains the how to output in a particular format
# Note: A data file with filename "P026-Addresses" should exists

# Whitespace within the value line is ignored
format ADDRESSLABEL =
+================================+
| @<<<<<<<<<<<<<<<<<<<<<<<<<<<<< |
$name
| @<<<<<<<<<<<<<<<<<<<<<<<<<<<<< |
$address
| @<<<<<<<<  @<<<<<<<<<  @<<<<<<<|
$city,          $state, $zip
+================================+

.

# Invoking a Format
open(ADDRESSES,"P032-Addresses") || die "Cannot open file for reading";          # For Reading
open(ADDRESSLABEL,">labels-to-print") || die "Cannot open file for writing";    # For Writing

while (<ADDRESSES>) {
        chomp; # remove newline
        ($name, $address, $city, $state, $zip) = split(/:/);

        # load up the global variables
        write (ADDRESSLABEL);   # Send the output
}

# Note:
# 1. The filehandle name (ADDRESSLABEL) is the same as the name of the format
# 2. The variable names are the same names as the ones we used when we defined the format.
#    This fact, too, is important.
# 3. The parameter to write is the filehandle to be written to, and by default, the format
#    of the same name is also used.
# 4. Each field in the format is replaced with the corresponding value from the next line
#    of the format
