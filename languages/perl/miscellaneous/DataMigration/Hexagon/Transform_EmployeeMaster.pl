#######################################################################################################
# Description: Data Migration Script for Hexagon Table Employee Master
# Notes: 
#       1. Rules for Hexagon Client Master Data 
#           - The data should be | seperated 
#           - The data should not have "
#           - The data should not have any header row
#       2.  
#######################################################################################################
use strict;

# Data Structure
my $inputFile                   = "DataHexagon\\PUserRights.txt";
my $outputFile                  = "DataPerfios\\hexagon_EmployeeMaster.txt";
my $perfiosUserInfoFile         = "DataPerfios\\perfios_k_user_info_Employee.txt";
my $mappingFile                 = "mapping_Employee.txt";
my $seperatorSource             = "\t";                                 # Data Field Seperator
my $seperatorTarget             = "\t";                                 # Data Field Seperator
my $debug_flag                  = 1;                                    # Debug Output Flag
my $processedRowCounter         = 0;

# DataStructure for Metadata
# [ColumnName, Order, ColumnType, defaultValue]
# Column Type = [NORMAL, PRIMARY, CODE, DEFAULT]
# Order is -1 for columnType = PRIMARY or CODE 
my @AoAMetadata                 = (
                                    ["id",                              -1,   "PRIMARY",    "\\N"],
                                    ["employee_id",                     -1,   "PRIMARY",    ""],
                                    ["EmployeeNum",                     -1,   "DEFAULT",    ""],
                                    ["Name",                            0,    "NORMAL",     "\\N"],
                                    ["Designation",                     -1,   "DEFAULT",    "\\N"],
                                    ["Address1",                        -1,   "DEFAULT",    "S-209, Suraj Ganga Arcade, 332/7, 15th Cross"],
                                    ["Address2",                        -1,   "DEFAULT",    "2nd Block Jayanagar"],
                                    ["CityCode",                        -1,   "DEFAULT",    "1"],
                                    ["OfficeExtn",                      -1,   "DEFAULT",    "XXXX"],
                                    ["Mobile",                          -1,   "DEFAULT",    "+91-XXXXX-XXXXX"],
                                    ["Landline",                        -1,   "DEFAULT",    "+91-80-XXXX-XXXX"],
                                  );

my @AoAMetadataUserInfo         = (
                                    ["user_id",                         -1,     "PRIMARY",      ""],
                                    ["emailid",                         -1,     "DEFAULT",      ""],
                                    ["password",                        -1,     "DEFAULT",      "c470e76df6ea6b50bb952dba2180043340d8c7cf"],
                                    ["acc_status",                      -1,     "DEFAULT",      "normal"],
                                    ["reg_date",                        -1,     "DEFAULT",      "1971-01-01"],
                                    ["last_login",                      -1,     "DEFAULT",      "1971-01-01 00:00:00"],
                                    ["enc_key",                         -1,     "DEFAULT",      "\\N"],
                                    ["dec_key",                         -1,     "DEFAULT",      "\\N"],
                                    ["user_hash",                       -1,     "DEFAULT",      "\\N"],
                                    ["screen_name",                     -1,     "DEFAULT",       "Employee"],
                                    ["feature_mask",                    -1,     "DEFAULT",      "3"],
                                    ["referrer",                        -1,     "DEFAULT",      "1"],
                                    ["tac_accepted",                    -1,     "DEFAULT",      "0"],
                                    ["reset_password",                  -1,     "DEFAULT",      "1"],
                                    ["login_count",                     -1,     "DEFAULT",      "0"],
                                    ["time_spent_in_sec",               -1,     "DEFAULT",      "0"],
                                    ["role_id",                         -1,     "DEFAULT",      "8"],
                                    ["wmf_id",                          -1,     "DEFAULT",      "2"],
                                    ["wmf_rm_id",                       -1,     "DEFAULT",      "\\N"],
                                    );

my @AoAMapping                  = (
                                    ["ClientCode",                      0,      "NORMAL",       ""],
                                    ["client_id",                       -1,     "PRIMARY",      ""],
                                    );
# Primary & Foreign Keys
my $foreignUserIdCounter        = 901;                                    # -1 means null
my $primaryEmployeeId           = 101;                                    # -1 means null

# Code Mapping Datastructure

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
        # Create employeeMaster table row
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
                    $fieldValue = $primaryEmployeeId;
                }
                if($i == 1) {
                    $fieldValue = $foreignUserIdCounter;    # Increment it at the end 
                }
             } elsif($AoAMetadata[$i][2] eq "DEFAULT") {                     # Default Value
                if($i == 2) {
                    $fieldValue = "E$primaryEmployeeId";
                    $primaryEmployeeId++;
                } else {
                    $fieldValue = "$AoAMetadata[$i][3]";	
                }
            }
            debug_print("Transformed Data for Column $i: $fieldValue");
            $row = "$row$fieldValue";
            # Check for Seperator Character
            if($i < $#AoAMetadata) {
                $row = "$row$seperatorTarget";
            }
        }
        print "Complete Row: $row\n"; 
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
                        $fieldValue = $foreignUserIdCounter.'@perfios.com';
                    } else {
                        $fieldValue = $AoAMetadataUserInfo[$i][3];    
                    }
                        
                }
            } elsif($AoAMetadataUserInfo[$i][2] eq "PRIMARY") {                     # Generated Columns - Primary
                if($i == 0) {
                    $fieldValue = $foreignUserIdCounter;
                }
            } elsif($AoAMetadataUserInfo[$i][2] eq "DEFAULT") {                     # Default Value
                if($i == 9) {
                    $fieldValue = "Employee ".$foreignUserIdCounter;
                } elsif($i == 1) {
                    $fieldValue = $foreignUserIdCounter.'@perfios.com';
                } else {
                    $fieldValue = "$AoAMetadataUserInfo[$i][3]";
                }
            }
            debug_print("Transformed Data for Column $i: $fieldValue");
            $row = "$row$fieldValue";
            
            # Check for Seperator Character
            if($i < $#AoAMetadataUserInfo) {
                $row = "$row$seperatorTarget";
            }
        }

        # Check for Newline Character
        if ($firstTime) {
            print OUTUSERINFO "$row"; 
            $firstTime = 0;       
        } else {
            print OUTUSERINFO "\n$row";        
        }       

        ++$foreignUserIdCounter;
        ++$processedRowCounter;
        print "$processedRowCounter\n";
    }
    close(IN);
    close(OUT);
    close(OUTUSERINFO);
    close(OUTMAPPING);
}

main();