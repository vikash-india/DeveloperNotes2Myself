#######################################################################################################
# Description: Data Migration Script for Hexagon Table Client Bank
# Notes: 
#       1. Rules for Hexagon Client Bank Data 
#           - The data should be tab seperated 
#           - The data should not have "
#           - The data should not have any header row
#       2.  
#######################################################################################################
use strict;

# Data Structure
my $inputFile                   = "DataHexagon\\ClientBank_Final.txt";
my $outputFile                  = "DataPerfios\\hexagon_ClientBank.txt";
my $seperatorSource             = "\t";                                 # Data Field Seperator
my $seperatorTarget             = "\t";                                 # Data Field Seperator
my $debug_flag                  = 0;                                    # Debug Output Flag
my $processedRowCounter         = 0;

# DataStructure for Metadata
# [ColumnName, Order, ColumnType, defaultValue]
# Column Type = [NORMAL, PRIMARY, CODE, DEFAULT]
# Order is -1 for columnType = PRIMARY or CODE 
my @AoAMetadata                 = (
                                    ["id",                      -1,     "PRIMARY",      ""],
                                    ["ClientCode",              0,      "NORMAL",       ""],
                                    ["BankCode",                1,      "NORMAL",       ""],
                                    ["BranchName",              2,      "NORMAL",       "\\N"],
                                    ["CityCode",                3,      "NORMAL",       "\\N"],
                                    ["PINCode",                 4,      "NORMAL",       "\\N"],
                                    ["BankAccountNumber",       5,      "NORMAL",       ""],
                                    ["AccountType",             6,      "CODE",       "\\N"],
                                    ["MICRNumber",              6,      "DEFAULT",      "\\N"],
                                    ["RTGSNumber",              6,      "DEFAULT",      "\\N"],
                                  );

my $primaryIdCounter = 1;

# Code Mapping Datastructure
my %accountType                 = ( '129'    => 'Savings',
									'130'    => 'Current',
									'131'    => 'NRE',
									'211'    => 'NRO',
									'212'    => 'Others',
									'352'    => '11.03% GOI 2012',
									'353'    => '11.09% GOI 2009');

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
        # Create table row
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
            } elsif($AoAMetadata[$i][2] eq "PRIMARY") {                     # Generated Columns - Primary
                if($i == 0) {
                    $fieldValue = $primaryIdCounter ;
                    $primaryIdCounter ++;
                }
            } elsif($AoAMetadata[$i][2] eq "DEFAULT") {                     # Default Value
                $fieldValue = "$AoAMetadata[$i][3]";
            } elsif($AoAMetadata[$i][2] eq "CODE") {                        # Code Translations
                if($i == 7) {
                    $fieldValue = $accountType{$dataFields[$AoAMetadata[$i][1]]};
                }
                # Set the Default Value if it is empty
                if(!$fieldValue) {
                    $fieldValue = $AoAMetadata[$i][3];
                }
                debug_print("Code Translation: $dataFields[$AoAMetadata[$i][1]] => $fieldValue");
            }

            $fieldValue = trim($fieldValue);
            
            #Customization according to the field
            if($i==3 || $i==4 || $i==5)
            {
            	$fieldValue =~ s/\s+//g;
            }

            debug_print("Transformed Data for Column $i: $fieldValue");
            $row = "$row$fieldValue";
            $fieldValue = trim($fieldValue);
            
            if(!$fieldValue)
            {
                $fieldValue = $AoAMetadata[$i][3];	
            }
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