#######################################################################################################
# Description: Data Cleanup Script for hexagon
# Notes: 
#       1. Clean Data Files
#       2.  
#######################################################################################################

my $inputFile               = "DataHexagon\\OneClient.txt"; 
my $outputFile              = "DataHexagon\\ClientMaster_OneClient";

my $fileWithNewLinesMarked  = $outputFile."_MarkNewLine.txt";
my $FileWithoutExtraNewLine = $outputFile."_NoExtraNewLines.txt";
my $FileFinal               = $outputFile."_Final.txt";

#######################################################################################################
# Mark All New Lines
#######################################################################################################
open(IN,    $inputFile)                 || die "Error open: $!";                  # For reading
open(OUT,   ">$fileWithNewLinesMarked") || die "Error open: $!";                  # For writing

while ($fileData = <IN>)
{
    $fileData =~ s/^"CL/"VCL/gs;     # Put a marker at the beginning
    print OUT $fileData;
}
close(IN);
close OUT;

#######################################################################################################
# Remove All New Lines
#######################################################################################################
# Read The full File in a string
{
    local $/=undef;
    open(IN, $fileWithNewLinesMarked)     || die "Error open: $!";                  # For reading
    my $fileData = <IN>;
    close IN;

    $fileData =~ s/\n//gs;              # Remove All \n Character
    $fileData =~ s/\t/ /gs;            # Remove the tab
    $fileData =~ s/\s+/ /gs;            # Remove all multiple space
    $fileData =~ s/"VCL/\n"CL/gs;       # Mark the New Line Characters

    #print $fileData;

    open(OUT,   ">$FileWithoutExtraNewLine") || die "Error open: $!";                  # For writing
    print OUT $fileData;
    close OUT;
}
#######################################################################################################
# Removes Comma from the Data
#######################################################################################################
open(IN, $FileWithoutExtraNewLine)     || die "Error open: $!";                  # For reading
open(OUT,   ">$FileFinal") || die "Error open: $!";                  # For writing
while($fileData = <IN>)
{
    if($fileData =~ m/(.*?",".*?",")(.*?")(.*?",".*?",")(.*?")(.*)/g)
    {
        my $part1 = $1;
        my $part2 = $2;
        my $part3 = $3;
        my $part4 = $4;
        my $part5 = $5;
        
        $part2 =~ s/,/</g;
        #print $part2,"\n";
       
        $part4 =~ s/,/</g;
        #print $part2,"\n";

        $line = "$part1$part2$part3$part4$part5";
        
        $line =~ s/,/\|/g;                   # Replace Comma with Pipe
        $line =~ s/"//g;                     # Remove Quotes                   
        $line =~ s/</,/g;                    # Replace < with Comma
        $line =~ s/\s+/ /g;                   # Replace all white space with single space
        
        print "$line\n";

        print OUT "$line\n";
        #print "Data: ".$fileData;
        #print "Part 1: $1\n";
        #print "Part 2: $2\n";
        #print "Part 3: $3\n";
    }
}

close IN;
close OUT;
