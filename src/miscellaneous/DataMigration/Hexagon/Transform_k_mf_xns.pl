#######################################################################################################
# Description: Data Migration Script for Hexagon Table ClientMaster
# Notes: 
#       1. Rules for Hexagon Client Master Data 
#           - The data should be | seperated 
#           - The data should not have "
#           - The data should not have any header row
#       2.  
#######################################################################################################
use strict;

# Data Structure
my $inputFile                   = "DataHexagon\\PortfolioManager.txt";
my $outputFile                  = "DataPerfios\\perfios_k_mf_acc_xns.txt";
my $mappingFile                 = "client_acc.txt";
my $seperatorSource             = ",";                                  # Data Field Seperator
my $seperatorTarget             = "\t";                                 # Data Field Seperator
my $debug_flag                  = 0;                                    # Debug Output Flag
my $processedRowCounter         = 0;
#my $gapBetweenUserAndAccount    = 1000;

# DataStructure for Metadata
# [ColumnName, Order, ColumnType, defaultValue]
# Column Type = [NORMAL, PRIMARY, CODE, DEFAULT]
# Order is -1 for columnType = PRIMARY or CODE 
my @AoAMetadata                 = (
                                    ["xn_id",                           -1,     "PRIMARY",      ""],
                                    ["acc_id",                          -1,     "PRIMARY",      ""], 
                                    ["scheme_id",                       -1,      "DEFAULT",      "\\N"],
                                    ["folio_no",                        14,     "NORMAL",       "\\N"],
                                    ["xn_date",                         4,      "NORMAL",       "\\N"],
                                    ["xn_type",                         5,      "CODE",         "\\N"],
                                    ["units",                           9,      "NORMAL",       "\\N"],
                                    ["NAV",                             8,      "NORMAL",       "\\N"],
                                    ["nav_date",                        4,      "NORMAL",       "\\N"],
                                    ["cost",                            6,      "NORMAL",       "\\N"],
                                    ["stt",                             -1,     "DEFAULT",      "\\N"],
                                    ["user_comment",                    7,      "NORMAL",       "NA"],
                                    ["xn_type_details",                 -1,     "DEFAULT",      "\\N"],
                                    ["auto_fetched",                    -1,     "DEFAULT",      "0"],
                                    ["error",                           6,      "DEFAULT",      "0"],
                                    ["system_msg",                      7,      "DEFAULT",      "\\N"],
                                    ["reversed_xn_id",                  9,      "DEFAULT",      "\\N"],
                                    ["hexagon_scheme_id",               2,      "NORMAL",       ""],
                                  );

# Primary & Foreign Keys
my $primaryXnsIdCounter         = 8001;
my $hashClientMap;

# Code Mapping Datastructure
# Perfios Mapping for xn_type
#   0 (<Specify>)                   1 (Reversal)                2  (Change of Folio)        3 (Purchase) 
#   4 (SIP Purchase)                5 (Switch In)               6  (Systematic Transfer In) 7  (Switch Out)
#   8 (Redeem)                      9 (Systematic Transfer Out) 10 (Systematic Withdrawal)  11 (Dividend Reinvestment)
#   12 (Dividend Payout)            25 (Others)

# Hexagon Mapping for xn_type
#   63  Purchase                    65  Dividend Re-invested    66  Dividend Paid-out       67 Redeemed
#   143 Bonus Declared              205 Switch In               206 Switch Out              
#   207 Systematic Investment       208 SystematTransfer Out    209 Rejected Transaction    
#   210 Non Financial               1148 Consolidate Folio      1176 STPO


my %transactionType             = ( '63'    => '3',              
									'65'    => '11',
									'66'    => '12',
									'67'    => '8',
									'143'   => '25',
									'205'   => '5',
									'206'   => '7',
									'207'   => '4',
									'208'   => '9',
									'209'   => '1',
									'210'   => '25',
									'1148'  => '2',
									'1176'  => '9');

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

sub CreateClientHash
{
    open(INMAP, $mappingFile) || die "Error open: $!";                # For reading 

    while(<INMAP>){
        chomp();
        my ($key, $value) = split /\t/;
        $hashClientMap->{$key} = $value;
    }
  
    close INMAP;
}

# Main Program
sub main
{
	CreateClientHash();
	
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
        # Create client_master table row
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
                    $fieldValue = $primaryXnsIdCounter;
                    ++$primaryXnsIdCounter;
                }
                if($i == 1) {
                	my $originalValue = $dataFields[1];
                	$dataFields[1] =~ s/"//g;
                	$dataFields[1] = trim($dataFields[1]);
                    #$fieldValue = $hashClientMap->{$dataFields[1]} + $gapBetweenUserAndAccount;
                    if($hashClientMap->{$dataFields[1]})
                    {
                       $fieldValue = $hashClientMap->{$dataFields[1]};
                             
                    }
                    else
                    {
                    	print "Error at $processedRowCounter for key |$originalValue|\n";
                    	
                    }
                    
                }
            } elsif($AoAMetadata[$i][2] eq "DEFAULT") {                     # Default Value
                $fieldValue = "$AoAMetadata[$i][3]";
            } elsif($AoAMetadata[$i][2] eq "CODE") {                        # Code Translations
                if($i == 5) {
                    $fieldValue = $transactionType{$dataFields[$AoAMetadata[$i][1]]};
                }
                # Set the Default Value if it is empty
                if(!$fieldValue) {
                    $fieldValue = $AoAMetadata[$i][3];
                }
                debug_print("Code Translation: $dataFields[$AoAMetadata[$i][1]] => $fieldValue");
            }
            debug_print("Transformed Data for Column $i: $fieldValue");
            # Customization goes here
            if($i == 11) {
            	if($fieldValue=~ m/\.0+/)
            	{
            		$fieldValue = 0;
            	}
                $fieldValue = $fieldValue.":".$dataFields[0];
            }
            
            if($i == 4 || $i == 7) {
                if($fieldValue =~ m/(.* )/)
                {
                    $fieldValue = $1;	
                }
            }
            
            $fieldValue =~ s/"//g;
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