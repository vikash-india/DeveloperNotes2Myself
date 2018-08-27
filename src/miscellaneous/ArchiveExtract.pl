#######################################################################################################
# Description: Test Script
# Notes: 
#       1. 
#       2.  
#######################################################################################################
use Archive::Extract;
use strict;

my $archivePath = "D:\\perfios\\logs\\gopichand-server-data\\kubera-logs.zip";


if (! -e $archivePath) 
{
    print "File Does not Exists!";
    exit 0;
}

# build an Archive::Extract object
my $archiveExtract = Archive::Extract->new(archive => $archivePath);

# extract to cwd()
#my $ok = $archiveExtract->extract or die $archiveExtract->error;    # Extract to Current Working Directory
my $ok = $archiveExtract->extract( to => "D:\\perfios\\logs\\gopichand-server-data\\" ) or die $archiveExtract->error;;

print "Archive Extracted[Status=$ok]\n";

my $outdir  = $archiveExtract->extract_path;
print "Extract Location: $outdir\n";

    

    