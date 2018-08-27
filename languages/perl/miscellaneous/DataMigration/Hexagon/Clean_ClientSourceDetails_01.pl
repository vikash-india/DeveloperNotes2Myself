#######################################################################################################
# Description: Data Cleanup Script for Client Source Details
# Notes: 
#       1. 
#       2.  
#######################################################################################################

my $inputFile  = "DataHexagon\\ClientSourceDetails.txt"; 
my $outputFile = "DataHexagon\\ClientSourceDetails";

my $fileWithNewLinesMarked  = $outputFile."_MarkNewLine.txt";
my $FileWithoutExtraNewLine = $outputFile."_NoExtraNewLines.txt";
my $FileFinal               = $outputFile."_Final.txt";

#######################################################################################################
# Mark All New Lines
#######################################################################################################
open(IN,    $inputFile)     || die "Error open: $!";                  # For reading
open(OUT,   ">$fileWithNewLinesMarked") || die "Error open: $!";                  # For writing

while ($fileData = <IN>)
{
    $fileData =~ s/^(False|True)/A$1/gs;     # Put a marker at the beginning
    print OUT $fileData;
}
close(IN);
close OUT;

#######################################################################################################
# Remove Extra New Line Character from the data
#######################################################################################################
local $/=undef;
open(IN, $fileWithNewLinesMarked)     || die "Error open: $!";                  # For reading
my $fileData = <IN>;
close IN;

$fileData =~ s/\n//gs;                      # Remove \n
$fileData =~ s/ATrue/\nTrue/gs;             # Replace MarkedNewLines with NewLines Character
$fileData =~ s/AFalse/\nFalse/gs;           # Replace MarkedNewLines with NewLines Character

#print $fileData;

open(OUT,   ">$FileWithoutExtraNewLine") || die "Error open: $!";                  # For writing
print OUT $fileData;
close OUT;
