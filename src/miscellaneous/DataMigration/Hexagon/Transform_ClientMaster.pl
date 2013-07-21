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
my $inputFile                   = "DataHexagon\\ClientMaster_Final.txt";
my $outputFile                  = "DataPerfios\\hexagon_ClientMaster.txt";
my $perfiosUserInfoFile         = "DataPerfios\\perfios_k_user_info.txt";
my $mappingFile                 = "mapping.txt";
my $seperatorSource             = "|";                                  # Data Field Seperator
my $seperatorTarget             = "\t";                                 # Data Field Seperator
my $debug_flag                  = 0;                                    # Debug Output Flag
my $processedRowCounter         = 0;

# DataStructure for Metadata
# [ColumnName, Order, ColumnType, defaultValue]
# Column Type = [NORMAL, PRIMARY, CODE, DEFAULT]
# Order is -1 for columnType = PRIMARY or CODE 
my @AoAMetadata                 = (
                                    ["ClientCode",                      0,    "NORMAL",     ""],
                                    ["client_id",                       -1,   "PRIMARY",    ""],
                                    ["ClientTitle",                     1,    "CODE",       "\\N"],
                                    ["ClientName",                      2,    "NORMAL",     "\\N"],
                                    ["GroupHead",                       4,    "CODE",       "0"],
                                    ["group_id",                        -1,   "DEFAULT",    "\\N"],
                                    ["ClientType",                      5,    "CODE",       "\\N"],
                                    ["Occupation",                      8,    "CODE",       "\\N"],
                                    ["GuardianName",                    -1,   "DEFAULT",    "\\N"],
                                    ["ContactPerson",                   -1,   "DEFAULT",    "\\N"],
                                    ["SecondApplicant",                 -1,   "DEFAULT",    "\\N"],
                                    ["NominationDetails",               -1,   "DEFAULT",    "\\N"],
                                    ["Chargeable",                      -1,   "DEFAULT",    "0"],
                                    ["FeesAmount",                      -1,   "DEFAULT",    "0.00"],
                                    ["DateOfBirth",                     6,    "NORMAL",     "\\N"],
                                    ["ClientSourceCode",                7,    "NORMAL",     "\\N"],
                                    ["PAN",                             9,    "NORMAL",     "\\N"],
                                    ["ResidentialAddress",              10,   "NORMAL",     "\\N"],
                                    ["ResidentialCityCode",             11,   "DEFAULT",     "\\N"],
                                    ["ResidentialPIN",                  12,   "NORMAL",     "\\N"],
                                    ["ResidentialPhone",                13,   "NORMAL",     "\\N"],
                                    ["CellPhone",                       -1,   "DEFAULT",    "\\N"],
                                    ["OfficeAddress",                   14,   "NORMAL",     "\\N"],
                                    ["OfficeCityCode",                  15,   "DEFAULT",     "\\N"],
                                    ["OfficePIN",                       16,   "NORMAL",     "\\N"],
                                    ["OfficePhone",                     17,   "NORMAL",     "\\N"],
                                    ["FaxNumber",                       19,   "NORMAL",     "\\N"],
                                    ["URL",                             20,   "NORMAL",     "\\N"],
                                    ["PreferredModeOfCommunication",    -1,   "DEFAULT",    "email"],
                                    ["SpouseName",                      21,   "NORMAL",     "\\N"],
                                    ["WeddingAnniversary",              22,   "NORMAL",     "\\N"],
                                  );

my @AoAMetadataUserInfo         = (
                                    ["user_id",                         -1,     "PRIMARY",      ""],
                                    ["emailid",                         18,     "DEFAULT",      ""],
                                    ["password",                        -1,     "DEFAULT",      "c470e76df6ea6b50bb952dba2180043340d8c7cf"],
                                    ["acc_status",                      -1,     "DEFAULT",      "normal"],
                                    ["reg_date",                        -1,     "DEFAULT",      "1971-01-01"],
                                    ["last_login",                      -1,     "DEFAULT",      "1971-01-01 00:00:00"],
                                    ["enc_key",                         -1,     "DEFAULT",      "\\N"],
                                    ["dec_key",                         -1,     "DEFAULT",      "\\N"],
                                    ["user_hash",                       -1,     "DEFAULT",      "\\N"],
                                    ["screen_name",                     -1,     "DEFAULT",       "Screen Name"],
                                    ["feature_mask",                    -1,     "DEFAULT",      "0"],
                                    ["referrer",                        -1,     "DEFAULT",      "1"],
                                    ["tac_accepted",                    -1,     "DEFAULT",      "0"],
                                    ["reset_password",                  -1,     "DEFAULT",      "1"],
                                    ["login_count",                     -1,     "DEFAULT",      "0"],
                                    ["time_spent_in_sec",               -1,     "DEFAULT",      "0"],
                                    ["role_id",                         -1,     "DEFAULT",      "1"],
                                    ["wmf_id",                          -1,     "DEFAULT",      "2"],
                                    ["wmf_rm_id",                       -1,     "DEFAULT",      "\\N"],
                                    );

my @AoAMapping                  = (
                                    ["ClientCode",                      0,      "NORMAL",       ""],
                                    ["client_id",                       -1,     "PRIMARY",      ""],
                                    );
# Primary & Foreign Keys
my $primaryClientIdCounter      = 2089;                                    # -1 means null

# Code Mapping Datastructure
my %clientTitle                 = ( '12'    => 'Mr.',
                                    '13'    => 'Ms.',
                                    '15'    => 'Mrs.',
                                    '17'    => '',
                                    '18'    => 'Dr.',
                                    '1188'  => 'Minor');

my %groupHead                   = ( 'True'    => '1',
                                    'False'    => '0',);

#Default value None
my %clientType                  = ( '19'=> 'Individual', 
							        '20'=> 'Trust', 
							        '21'=> 'Minor', 
							        '22'=> 'HUF', 
							        '23'=> 'Society', 
							        '24'=> 'NRI', 
							        '25'=> 'FIIs', 
							        '26'=> 'OCB', 
							        '27'=> 'Partnership', 
							        '28'=> 'AOP/BOI', 
							        '29'=> 'Extra', 
							        '30'=> 'Company');
							        
my %occupation                  = ( '125'=>'Professional',
									'126'=>'Housewife',
									'127'=>'Business',
									'128'=>'Service',
									'167'=>'Retired',
									'168'=>'Student',
									'169'=>'Others');
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
    open(OUTUSERINFO,   ">$perfiosUserInfoFile")    || die "Error open: $!";                # For writing k_user_info 
    open(OUTMAPPING,    ">$mappingFile")            || die "Error open: $!";                # For writing mapping
    
    print "Processed Row Number:\n";
    my $firstTime = 1;
    while (<IN>)
    {
        chomp;
        my @dataFields = split(/\|/, $_);
        
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
				if($i == 1) {
                    $fieldValue = $primaryClientIdCounter;
                    # $primaryClientIdCounter++;
				}
            } elsif($AoAMetadata[$i][2] eq "DEFAULT") {                     # Default Value
                $fieldValue = "$AoAMetadata[$i][3]";
			} elsif($AoAMetadata[$i][2] eq "CODE") {                        # Code Translations
                if($i == 2) {
                    $fieldValue = $clientTitle{$dataFields[$AoAMetadata[$i][1]]};
                }
                if($i == 4) {
                    $fieldValue = $groupHead{$dataFields[$AoAMetadata[$i][1]]};
                }
                if($i == 6) {
                    $fieldValue = $clientType{$dataFields[$AoAMetadata[$i][1]]};
                }
                if($i == 7) {
                    $fieldValue = $occupation{$dataFields[$AoAMetadata[$i][1]]};
                }
                # Set the Default Value if it is empty
                if(!$fieldValue) {
                    $fieldValue = $AoAMetadata[$i][3];
                }
                debug_print("Code Translation: $dataFields[$AoAMetadata[$i][1]] => $fieldValue");
            }
			debug_print("Transformed Data for Column $i: $fieldValue");
			
			# Customization
			if($i==15)
			{
				$fieldValue =~ s/\s+//g;
			}
			
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
			# $firstTime = 0;
		} else {
			print OUT "\n$row";        
		}
		
		
		####################################################################
		# Create k_user_info table row
		####################################################################
        debug_print("--------------------------k_user_info");
        $row = "";
        for my $i (0 .. $#AoAMetadataUserInfo) 
        {
            debug_print("k_user_info Metadata(Column $i): $AoAMetadataUserInfo[$i][0]\t$AoAMetadataUserInfo[$i][1]\t$AoAMetadataUserInfo[$i][2]\t$AoAMetadataUserInfo[$i][3]");
            my $fieldValue;

            if($AoAMetadataUserInfo[$i][2] eq "NORMAL") {                           # Normal Columns
                $fieldValue = trim($dataFields[$AoAMetadataUserInfo[$i][1]]);
                if(!$fieldValue) {
                    if($i == 1) {                                                   # Create Default Values
                        $fieldValue = $primaryClientIdCounter.'@perfios.com';
                    } else {
                        $fieldValue = $AoAMetadataUserInfo[$i][3];    
                    }
                        
                }
            } elsif($AoAMetadataUserInfo[$i][2] eq "PRIMARY") {                     # Generated Columns - Primary
                if($i == 0) {
                    $fieldValue = $primaryClientIdCounter;
                }
            } elsif($AoAMetadataUserInfo[$i][2] eq "DEFAULT") {                     # Default Value
                if($i == 9) {
                    $fieldValue = "Screen Name ".$primaryClientIdCounter;
                } elsif($i == 1) {
                    $fieldValue = $primaryClientIdCounter.'@perfios.com';
                } else {
                    $fieldValue = "$AoAMetadataUserInfo[$i][3]";
                }
            }
            
            debug_print("Transformed Data for Column $i: $fieldValue");
            $row = "$row$fieldValue";
            
            # Check for Seperator Character
            if($i < $#AoAMetadataUserInfo) {            # Bug might be here
                $row = "$row$seperatorTarget";
            }
        }
        
        
        # Check for Newline Character
        if ($firstTime) {
            print OUTUSERINFO "$row";        
        } else {
            print OUTUSERINFO "\n$row";        
        }		
		
        ####################################################################
        # Mapping row
        ####################################################################
        debug_print("--------------------------Mappings");
        $row = "";
        for my $i (0 .. $#AoAMapping) 
        {
            debug_print("Mapping Metadata(Column $i): $AoAMapping[$i][0]\t$AoAMapping[$i][1]\t$AoAMapping[$i][2]\t$AoAMapping[$i][3]");
            my $fieldValue;

            if($AoAMapping[$i][2] eq "NORMAL") {                           # Normal Columns
                $fieldValue = $dataFields[$AoAMapping[$i][1]];
                if(!$fieldValue) {
                    $fieldValue = $AoAMapping[$i][3];
                }
            } elsif($AoAMapping[$i][2] eq "PRIMARY") {                     # Generated Columns - Primary
                if($i == 1) {
                    $fieldValue = $primaryClientIdCounter;
                    $primaryClientIdCounter++;
                }
            }
            
            debug_print("Transformed Data for Column $i: $fieldValue");
            $row = "$row$fieldValue";
            
            # Check for Seperator Character
            if($i < $#AoAMapping) {
                $row = "$row$seperatorTarget";
            }
        }
        
        
        # Check for Newline Character
        if ($firstTime) {
            print OUTMAPPING "$row";        
            $firstTime = 0;
        } else {
            print OUTMAPPING "\n$row";        
        }
		
		++$processedRowCounter;
        print "$processedRowCounter\n";
    }
    close(IN);
    close(OUT);
    close(OUTUSERINFO);
    close(OUTMAPPING);
}

main();