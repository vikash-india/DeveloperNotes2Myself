#######################################################################################################
# Description: Data Migration Script for Hexagon Table ClientMaster
# Notes: 
#       1. Rules for Hexagon Accounts
#           - The data should be \t seperated 
#           - The data should not have "
#           - The data should not have any header row
#       2.  Run this Script after Mapping.txt is created by Transform_ClientMaster
#######################################################################################################
use strict;

# Data Structure
my $inputFile                   = "mapping.txt";
my $outputFile                  = "DataPerfios\\pefios_k_user_accounts.txt";
my $seperatorSource             = "\t";                                 # Data Field Seperator
my $seperatorTarget             = "\t";                                 # Data Field Seperator
my $debug_flag                  = 0;                                    # Debug Output Flag
my $processedRowCounter         = 0;

# DataStructure for Metadata
# [ColumnName, Order, ColumnType, defaultValue]
# Column Type = [NORMAL, PRIMARY, CODE, DEFAULT]
# Order is -1 for columnType = PRIMARY or CODE 
my @AoAMetadata                 = (
                                    ["acc_id",                          -1,     "PRIMARY",      ""],
                                    ["user_id",                         1,      "NORMAL",       ""],
                                    ["inst_id",                         1,      "DEFAULT",      "2999"],
                                    ["acc_name",                        2,      "DEFAULT",      "Hexagon MF"],
                                    ["acc_status",                      4,      "DEFAULT",      "active"],
                                    ["auto_fetch",                      -1,     "DEFAULT",      "0"],
                                    ["start_date",                      5,      "DEFAULT",      "2009-07-01"],
                                    ["end_date",                        8,      "DEFAULT",      "\\N"],
                                    ["last_update",                     -1,     "DEFAULT",      "2009-07-01 00:00:00"],
                                    ["password_mismatch",               -1,     "DEFAULT",      "0"],
                                    ["unsupported_inst_name",           -1,     "DEFAULT",      "Hexagon MF"],
                                    ["acc_pat",                         -1,     "DEFAULT",      "\\N"],
                                    ["link_num",                        -1,     "DEFAULT",      "0"],
                                    ["auto_fetch_blocked",              -1,     "DEFAULT",      "0"],
                                    ["wmf_id",                          6,      "DEFAULT",      "2"],
                                  );

# Primary & Foreign Keys
my $primaryAccountId    = 2001;

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
                    $fieldValue = $primaryAccountId;
                    $primaryAccountId++;
                }
            } elsif($AoAMetadata[$i][2] eq "DEFAULT") {                     # Default Value
                $fieldValue = "$AoAMetadata[$i][3]";
            } 
            debug_print("Transformed Data for Column $i: $fieldValue");
            
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