#######################################################################################################
# Description: Data Migration Script for hexagon
# Notes: 
#       1. Creates the tab seperated final data
#       2.  
#######################################################################################################
my $inputFile  = "DataHexagon\\ClientSourceDetails.txt"; 
my $outputFile = "DataHexagon\\ClientSourceDetails";

my $fileWithNewLinesMarked  = $outputFile."_MarkNewLine.txt";
my $FileWithoutExtraNewLine = $outputFile."_NoExtraNewLines.txt";
my $FileFinal               = $outputFile."_Final.txt";
#######################################################################################################
# Remove Comma from the Data
#######################################################################################################
open(IN, $FileWithoutExtraNewLine)      || die "Error open: $!";                  # For reading
open(OUT,   ">$FileFinal")       || die "Error open: $!";                  # For writing
while($fileData = <IN>)
{
    if($fileData =~ m/(.*?",".*?",")(.*?")(.*)/g)
    {
        my $part1 = $1;
        my $part2 = $2;
        my $part3 = $3;
        
        $part2 =~ s/,/</g;
        #print $part2,"\n";

        my $row = "$part1$part2$part3";
        $row =~ s/,/\|/g;                   # Replace Comma with Tab
        $row =~ s/"//g;                     # Remove Quotes                   
        $row =~ s/</,/g;                    # Remove < with Comma
        
        print OUT "$row\n";
    }
}

close IN;
close OUT;
