#######################################################################################################
# Description: Test Script
# Notes: 
#       1. 
#       2.  
#######################################################################################################
use DBI;
use strict;

my $dbh = DBI->connect('DBI:mysql:gopichand', 'root', 'root',
                { RaiseError => 1 }
               );
   
my $sthAddNewJob        = $dbh->prepare(qq{CALL g_autoupdate_add_new_job(?,?)});  
my $sthAddJobDetails    = $dbh->prepare(qq{CALL g_autoupdate_add_job_details(?,?,?,?,?,?,?,?)});  
my $sthGetJobCount      = $dbh->prepare(qq{CALL g_autoupdate_get_job_count(?)});
my $sthGetJobCountQuery = $dbh->prepare(qq{select count(*) from gopichand.g_auto_update_jobs where job_number = ?});

# Execute Stored Proc
my $rv = $sthAddNewJob->execute(1, '2010-12-22') or die "SP execution Failed: " . $sthAddNewJob->errstr;
print("New Job Added: $rv \n");

$rv = $sthAddJobDetails->execute(1, 11, 'ICICICC', 111, 1111, 'Acc1', '2010-12-22', '2010-12-23') or die "SP execution Failed: " . $sthAddJobDetails->errstr; 
print("New Job Details Added: $rv \n");

# Execute Query
$sthGetJobCountQuery->bind_param(1, 11);  # placeholders are numbered from 1
$sthGetJobCountQuery->execute;
while (my @row = $sthGetJobCountQuery->fetchrow_array) 
{
  print "@row or $row[0]\n";
}

$sthGetJobCountQuery->bind_param(1, 11);  # placeholders are numbered from 1
$sthGetJobCountQuery->execute;
while (my @row = $sthGetJobCountQuery->fetchrow_array) 
{
  print "Another @row or $row[0]\n";
}

#$sthGetJobCountQuery->bind_param(1, 11);  # placeholders are numbered from 1
#$sthGetJobCountQuery->execute;
#if (my @row = $sthGetJobCountQuery->fetchrow_array) 
#{
#  print "IF Condition @row or $row[0]\n";
#}

# DBI::dump_results($sthGetJobCountQuery);

$dbh->disconnect();

