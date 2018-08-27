#######################################################################################################
# Description: Data Migration Script for Hexagon Table City Master
# Notes: 
#       1. Rules for Hexagon City Master Data 
#           - The data should be tab seperated 
#           - The data should not have "
#           - The data should not have any header row
#       2.  
#######################################################################################################
use strict;

# Data Structure
my $inputFile                   = "DataHexagon\\PCityMaster.txt";
my $outputFile                  = "DataPerfios\\hexagon_CityMaster.txt";
my $seperatorSource             = "\t";                                  # Data Field Seperator
my $seperatorTarget             = "\t";                                 # Data Field Seperator
my $debug_flag                  = 0;                                    # Debug Output Flag
my $processedRowCounter         = 0;

# DataStructure for Metadata
# [ColumnName, Order, ColumnType, defaultValue]
# Column Type = [NORMAL, PRIMARY, CODE, DEFAULT]
# Order is -1 for columnType = PRIMARY or CODE 
my @AoAMetadata                 = (
                                    ["CityCode",                        0,      "NORMAL",       ""],
                                    ["CityName",                        1,      "NORMAL",       ""],
                                    ["STDCode",                         2,      "NORMAL",       "\\N"],
                                    ["StateName",                       4,      "CODE",         ""],
                                    ["CountryName",                     6,      "CODE",         ""],
                                  );

# Code Mapping Datastructure
my %countryCode                 = ( 'IN'    => 'India',
                                    'US'    => 'USA',
                                    'AU'    => 'Australia');

my %stateCode                   = ( '1'     =>   'Karnataka',     
									'2'     =>   'Tamil Nadu',    
                                    '3'     =>   'Andhra Pradesh',
									'4'     =>   'Maharashtra',   
									'5'     =>   'Uttar Pradesh', 
									'6'     =>   'Kerala',        
									'7'     =>   'Goa',           
									'8'     =>   'Assam',         
									'9'     =>   'Madhya Pradesh',
									'10'    =>  'Haryana',       
									'11'    =>  'WestBengal',    
									'12'    =>  'Gujarat',       
									'13'    =>  'West Bengal',   
									'14'    =>  'Texas',         
									'15'    =>  'Goa',           
									'16'    =>  'Rajastan',      
									'17'    =>  'Orissa');

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

# Main Program
sub main
{
    open(IN,            $inputFile)                 || die "Error open: $!";                # For reading 
    open(OUT,           ">$outputFile")             || die "Error open: $!";                # For writing client_master
    
    print "Processed Row Number:\n";
    my $firstTime = 1;
    while (<IN>)
    {
        chomp;
        my @dataFields = split($seperatorSource, $_);
        
        debug_print("Data: ".join(",", @dataFields));
        
        ####################################################################
        # Create city_master table row
        ####################################################################
        my $row = "";
        for my $i (0 .. $#AoAMetadata) 
        {
            debug_print("Metadata(Column $i): $AoAMetadata[$i][0]\t$AoAMetadata[$i][1]\t$AoAMetadata[$i][2]\t$AoAMetadata[$i][3]");
            my $fieldValue;

            if($AoAMetadata[$i][2] eq "NORMAL") {                           # Normal Columns
                $fieldValue = $dataFields[$AoAMetadata[$i][1]];
                if(!$fieldValue) {
                    $fieldValue = $AoAMetadata[$i][3];
                }
            } elsif($AoAMetadata[$i][2] eq "CODE") {                        # Code Translations
                if($i == 3) {
                    $fieldValue = $stateCode{$dataFields[$AoAMetadata[$i][1]]};
                }
                if($i == 4) {
                    $fieldValue = $countryCode{$dataFields[$AoAMetadata[$i][1]]};
                }
                # Set the Default Value if it is empty
                if(!$fieldValue) {
                    $fieldValue = $AoAMetadata[$i][3];
                }
                debug_print("Code Translation: $dataFields[$AoAMetadata[$i][1]] => $fieldValue");
            }
            debug_print("Transformed Data for Column $i: $fieldValue");
            $fieldValue = trim($fieldValue);
            $row = "$row$fieldValue";
            
            # Check for Seperator Character
            if($i < $#AoAMetadata) {
                $row = "$row$seperatorTarget";
            }
        }
        
        # Check for Newline Character
        if ($firstTime) {
            print OUT "$row";        
            $firstTime = 0;
        } else {
            print OUT "\n$row";        
        }
        
        ++$processedRowCounter;
        print "$processedRowCounter\n";
    }
    close(IN);
    close(OUT);
}

main();