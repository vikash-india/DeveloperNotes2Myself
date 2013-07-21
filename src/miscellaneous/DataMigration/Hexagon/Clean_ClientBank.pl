#######################################################################################################
# Description: Data Cleanup Script for hexagon
# Notes: 
#       1. Clean Data Files
#       2.  
#######################################################################################################

my $inputFile               = "DataHexagon\\ClientBank.txt"; 
my $outputFile              = "DataHexagon\\ClientBank";

my $FileFinal               = $outputFile."_Final.txt";

#######################################################################################################
# Clean Up
#######################################################################################################
open(IN,    $inputFile)                 || die "Error open: $!";                  # For reading
open(OUT,   ">$FileFinal")              || die "Error open: $!";                  # For writing

while ($fileData = <IN>)
{
    if($fileData =~ m/(.*?,.*?,")(.*?")(.*)/g)
    {
        my $part1 = $1;
        my $part2 = $2;
        my $part3 = $3;
        
        $part2 =~ s/,/</g;
        #print $part2,"\n";
       
        $line = "$part1$part2$part3";
        
        #$line =~ s/\s/ /g;                   # Replace all white space with single space
        $line =~ s/,/\t/g;                   # Replace Comma with Pipe
        $line =~ s/"//g;                     # Remove Quotes                   
        $line =~ s/</,/g;                    # Replace < with Comma
        
        print "$line\n";

        print OUT "$line\n";
    }
}
close(IN);
close OUT;