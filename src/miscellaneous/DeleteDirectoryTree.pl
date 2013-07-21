#######################################################################################################
# Description: Test Script
# Notes: 
#       1. 
#       2.  
#######################################################################################################
use File::Path;
use strict;

my $archivePath = "D:\\perfios\\logs\\gopichand-server-data\\Test";

rmtree($archivePath);                           # Delete 1 Directory Tree
# rmtree([$archivePath, $archivePath2]);        # Delete Multiple Paths

print "Directory Deleted";