#######################################################################################################
# Description: Data Migration Script for Hexagon Table Client Groups
# Notes: 
#       1. Rules for Hexagon Client Groups Data 
#           - The data should be tab seperated 
#           - The data should not have "
#           - The data should not have any header row
#       2.  
#######################################################################################################
use strict;

# Data Structure
my $inputFile                   = "DataHexagon\\ClientGroups.txt";
my $outputFile                  = "DataPerfios\\hexagon_ClientGroups.txt";
my $updateScript                = "DataPerfios\\SQL_ClientGroups.sql";
my $seperatorSource             = "\t";                                 # Data Field Seperator
my $seperatorTarget             = "\t";                                 # Data Field Seperator
my $debug_flag                  = 0;                                    # Debug Output Flag
my $processedRowCounter         = 0;


# DataStructure for Metadata
my $groupIDStart                = 11;

# Functions
sub debug_print
{
    my $message = shift;
    if ($debug_flag)
    {
        print "Debug: $message\n";
    }
}

sub trim($)
{
    my $string = shift;
    $string =~ s/^\s+//;
    $string =~ s/\s+$//;
    return $string;
}

my %clientGroup;

# Main Program
sub main
{
    #####################################################################################
    # Create a client groups
    #####################################################################################
    open(IN,            $inputFile)                 || die "Error open: $!";                # For reading 
    while (<IN>)
    {
        chomp;
        my @dataFields = split($seperatorSource, $_);
        debug_print("Data: ".join(",", @dataFields));
        
        $clientGroup{"$dataFields[0]"} = "NULL";
        
    }
    close(IN);
    
    
    open(OUT, ">$outputFile") || die "Error open: $!";                # For reading
    
    my $firstTime = 1;
    for my $key ( keys %clientGroup ) 
    {
        my $row = "$groupIDStart"."\t"."Group of $key";
        $clientGroup{$key} = $groupIDStart;
        if($firstTime)
        {
            print OUT "$row";
            $firstTime = 0;	
        }
        else
        {
            print OUT "\n$row";
        }        	
        
        $groupIDStart++;
    }
    
    close(OUT);
    #####################################################################################
    # Create the update Script - update hexagon.clientmaster set group_id = 1 where clientCode='CL00010';
    #####################################################################################
    
    open(IN,    $inputFile)     || die "Error open: $!";                # For reading 
    open(OUT, ">$updateScript") || die "Error open: $!";                # For reading
    while (<IN>)
    {
        chomp;
        my @dataFields = split($seperatorSource, $_);
        #debug_print("Data: ".join(",", @dataFields));
        
        print OUT 'update hexagon.ClientMaster set group_id = '.$clientGroup{"$dataFields[0]"}.' where ClientCode=\''.$dataFields[1]."\';\n";
    }
    close(IN);
    close(OUT);
    

}

main();