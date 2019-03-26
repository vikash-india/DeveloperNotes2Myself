#######################################################################################################
# Description: Kubera Log Parser
# Notes: 
#       1. Parses Kubera Log for Auto-update Jobs from incremental Logs 
#       2. Archive Kubera Log after parsing
#######################################################################################################
use DBI;
use File::Path;
use Archive::Extract;
use IO::Handle;

use strict;
use warnings;
use diagnostics;

STDOUT->autoflush(1);
STDERR->autoflush(1);

# Global Datastructure & Initializations
my $numArgs = $#ARGV + 1;
if($numArgs < 4)
{
	print "Incorrect Arguments. Usage \n";
	exit -1;
}
my $scriptLogFile           = $ARGV[0];     
my $syncLogDirectory        = $ARGV[1];
my $dbUserName              = $ARGV[2];
my $dbPassword              = $ARGV[3];
if($syncLogDirectory !~ /\\$/)
{
	$syncLogDirectory = $syncLogDirectory."\\";
}

my $kuberaLogDirName        = "kubera-logs";         
my $archiveDirName          = "archive";
my $incKuberaLogArchiveFile = $syncLogDirectory."kubera-logs.zip";
my $kuberaLogPath           = "$syncLogDirectory$kuberaLogDirName";
my $kuberaArchivePath       = "$syncLogDirectory$archiveDirName\\$kuberaLogDirName";

# Open the file for logging
open(LOGHANDLER,">>$scriptLogFile") || die("Cannot Open File for Logging");

# Database Handle
my $dbh = DBI->connect('DBI:mysql:gopichand', $dbUserName, $dbPassword,
                { RaiseError => 1 }
               );

# Stored Proc for AutoUpdate Jobs
my $sthAddNewJob            = $dbh->prepare(qq{CALL g_autoupdate_add_new_job(?,?)});  
my $sthAddJobDetails        = $dbh->prepare(qq{CALL g_autoupdate_add_job_details(?,?,?,?,?,?,?,?)});
my $sthAddJobDebugStatus    = $dbh->prepare(qq{CALL g_autoupdate_add_job_debug_status(?,?,?)});
my $sthAddDataDirectory     = $dbh->prepare(qq{CALL g_autoupdate_add_data_directory(?,?)});
my $sthRemoveThreadId       = $dbh->prepare(qq{CALL g_autoupdate_remove_thread_id(?)});
my $sthAddLogTrail          = $dbh->prepare(qq{CALL g_autoupdate_add_log_trail(?,?,?)});
my $sthGetJobCountQuery     = $dbh->prepare(qq{select count(*) from gopichand.g_auto_update_jobs where job_number = ?});

# Auto Update Job Details
my $newJob                  = "false";
my $recordId                = 0;
my $jobNumber               = -1;
my $jobType                 = "";
my $userId                  = "";
my $accId                   = "";
my $accName                 = "";
my $fromDate                = "";
my $toDate                  = "";

# Temporary Loop Variables
my $threadId                = "";
my $logMessage              = "";
my $logType                 = "";
my $logDate                 = "";
my $logTime                 = "";
my $debugStatusMessage      = "";
my $debugStatus             = "false";
my $dbReturnValue           = 0;
my @lineComponents;

# Main Program
main();

sub main
{
    print LOGHANDLER getTimestamp()."\tBeginning Incremental Kubera Logs Parsing\n";
	
    # Extract all the files from the Zipped Archive
#    if (! -e $incKuberaLogArchiveFile) 
#    {
#        print LOGHANDLER getTimestamp()."\tWarning: $incKuberaLogArchiveFile does not exist\n";
#        print "#ARCHIVE_NOT_FOUND#\n";
#        exit 0;
#    }
#    print LOGHANDLER getTimestamp()."\tArchive file found: $incKuberaLogArchiveFile\n";

    my $archiveExtract = Archive::Extract->new(archive => $incKuberaLogArchiveFile);
    my $status = $archiveExtract->extract( to => $syncLogDirectory) or die $archiveExtract->error;
    print LOGHANDLER getTimestamp()."\tArchive file extracted Successfully\n";
    $archiveExtract = undef;
	
    # Create "archive" directory if it does not exist
    if (!-d "$syncLogDirectory$archiveDirName") {
    	mkdir("$syncLogDirectory$archiveDirName") || die "Could not create archive Directory: $syncLogDirectory\\$archiveDirName. Error: $!\n";
    	print LOGHANDLER getTimestamp()."\tDirectory $syncLogDirectory$archiveDirName not found. Directory created successfully\n";
    }
    
    # Create "kubera-logs" directory inside "archive" directory if it does not exist
    if (!-d $kuberaArchivePath) {
        mkdir($kuberaArchivePath) || die "Could not create Kubera Archive Directory: $kuberaArchivePath. Error: $!\n";
        print LOGHANDLER getTimestamp()."\tDirectory $kuberaArchivePath not found. Directory created successfully\n";
    }
        	
    # Read all the Files in the Directory and parse each of them
    if (! -d $kuberaLogPath)
    {
    	print LOGHANDLER getTimestamp()."\tWarning: $kuberaLogPath is not a Directory\n";
    	print LOGHANDLER getTimestamp()."\t#DIRECTORY_NOT_FOUND#\n";
        exit 0;
    }
    
    # Read the Directory Contents for Kubera Logs    
    opendir(DIR_HANDLE, $kuberaLogPath) || die("Cannot open directory");         	
    my @filesList = readdir(DIR_HANDLE);
    closedir(DIR_HANDLE); 
    
    # Create a Hash for Sorting Filenames Chronologically
    my %hash = ();
	foreach my $fileName (@filesList)
	{
        if($fileName =~ /kubera.(\d\d).(\d\d).(\d\d\d\d).log$/)
        {
        	my $date = $3."-".$2."-".$1;
        	$hash{$date} = $fileName; 
        }
	}

    # Process each Kubera Log file
	foreach my $key (sort keys %hash)
	{
		my $fileName = $hash{$key};
        print LOGHANDLER getTimestamp()."\tParsing Kubera Log File: $fileName\n";
	    open (LOGFILE, "$kuberaLogPath\\$fileName") || die "couldn't open the file $!";
	    
        open(ARCHIVE,">>$kuberaArchivePath\\$fileName") || die("Cannot Open File for Archiving");
	    
	    my $line = "";
	    while ($line = <LOGFILE>) 
	    {
	        # Parse Each Line for AutoUpdate Jobs
	        parseAutoUpdateJobs($line);   
	        
	        # TODO: Parse Each Line for Statement Failures or Mapping Failures etc....

            # Print the content to Archive
            print ARCHIVE $line;
	    }
	    
	    close(LOGFILE);
	    close(ARCHIVE);
	}
    
    
    # Close the Database Handle
    $dbh->disconnect();
    $dbh = undef;

    print LOGHANDLER getTimestamp()."\tKubera Log Parsing Successful\n";
    print ("#Success#\n");
    
    close(LOGHANDLER);
    exit 0;
}

sub parseAutoUpdateJobs
{
	my $line = shift;
	if($line eq "")
	{
		print LOGHANDLER getTimestamp()."\tNo Line to process.\n";
		return;
	}
	
    # Initialize Loop Variables
	my $logMessage            = "";
	my $logType               = "";
	my $logDate               = "";
	my $logTime               = "";
	my $debugStatusMessage    = "";
	my $debugStatus           = "false";
	my $logDateTime           = "";

	# Start Processing
	my @lineComponents = split(/\t/, $line);
	my $length = @lineComponents;
	if($length == 5)
	{
		$logType     = $lineComponents[0];
		$threadId    = $lineComponents[1];
		$logDate     = $lineComponents[2];
		$logTime     = $lineComponents[3];
		$logMessage  = $lineComponents[4];
		if($logDate =~ /(..).(..).(....)/)
		{
			$logDateTime = $3."-".$2."-".$1." ".$logTime;
		}
		# print "Thread ID: $threadId\n";
	} 
	else 
	{
		$logMessage = $line;
		# print ("Exception or Multiline Log Found. Using Previous Thread ID: $threadId\n");
	}

    # A new autoupdate job pattern: Add a new Job
	if($logMessage =~ /\/kv\?FETCHACCTXS/)
	{
        print LOGHANDLER getTimestamp()."\tNew Auto-update Job Detected: $threadId\n";
        # AutoUpdateJobDB.setJobsThreadIdToNull(threadId);
        $dbReturnValue = $sthRemoveThreadId->execute($threadId) or die "SP execution Failed: " . $sthRemoveThreadId->errstr;
			
		# AutoUpdateJobDB.insertNewJob(threadId, logDate, logTime);
        $dbReturnValue = $sthAddNewJob->execute($threadId, $logDateTime) or die "SP execution Failed: " . $sthAddNewJob->errstr;
    }

    # Job Details Pattern a recently added job: Update Job Details 
	if($logMessage =~ /.*?Scheduling job.*?job#(.*?),jobType=(.*?),userId=(.*?),accId=(.*?),accName=(.*?),fromDate=(.*?),toDate=(.*?)\]/)
	{
		# print ("Job Description Detected: \n");
		$jobNumber    = $1;
		$jobType      = $2;
		$userId       = $3;
		$accId        = $4;
		$accName      = $5;
		$fromDate     = $6;
		$toDate       = $7;
			
        # print ("threadId=$threadId jobNumber=$jobNumber jobType=$jobType userId=$userId accId=$accId accName=$accName fromDate=$fromDate toDate=$toDate \n");
        # AutoUpdateJobDB.updateJobInfo(threadId, jobNumber, jobType, userId, accId, accName, fromDate, toDate);      
        $dbReturnValue = $sthAddJobDetails->execute($threadId, $jobNumber, $jobType, $userId, $accId, 
                        $accName, $fromDate, $toDate) or die "SP execution Failed: " . $sthAddJobDetails->errstr;
    }

	# Job Details Pattern from a Queued job: Update Job Details 
	if($logMessage =~ /.*?Another job with the same.*?job#(.*?),jobType=(.*?),userId=(.*?),accId=(.*?),accName=(.*?),fromDate=(.*?),toDate=(.*?)\]/)
	{
		# print ("Job Description of an Existing Job Detected: \n");
		$jobNumber    = $1;
		$jobType      = $2;
		$userId       = $3;
		$accId        = $4;
		$accName      = $5;
		$fromDate     = $6;
		$toDate       = $7;
		# print("threadId=$threadId jobNumber=$jobNumber jobType=$jobType userId=$userId accId=$accId accName=$accName fromDate=$fromDate toDate=$toDate\n");
		
		# AutoUpdateJobDB.updateJobInfo(threadId, jobNumber, jobType, userId, accId, accName, fromDate, toDate);
        $dbReturnValue = $sthAddJobDetails->execute($threadId, $jobNumber, $jobType, $userId, $accId, 
        $accName, $fromDate, $toDate) or die "SP execution Failed: " . $sthAddJobDetails->errstr;
    }

	# Job Details Pattern of a Linked job: Add a new Job and update Job Details 
	if($logMessage =~ /.*?Scheduling linked job.*?job#(.*?),jobType=(.*?),userId=(.*?),accId=(.*?),accName=(.*?),fromDate=(.*?),toDate=(.*?)\]/)
	{
		# print("Job Description of a Linked Job Detected: ");
		$jobNumber    = $1;
		$jobType      = $2;
		$userId       = $3;
		$accId        = $4;
		$accName      = $5;
		$fromDate     = $6;
		$toDate       = $7;
	                    
	    # print("threadId=$threadId jobNumber=$jobNumber jobType=$jobType userId=$userId accId=$accId accName=$accName fromDate=$fromDate toDate=$toDate\n");
		                    
	    # AutoUpdateJobDB.setJobsThreadIdToNull(threadId);
        $dbReturnValue = $sthRemoveThreadId->execute($threadId) or die "SP execution Failed: " . $sthRemoveThreadId->errstr;
		    
	    # AutoUpdateJobDB.insertNewJob(threadId, logDate, logTime);
        $dbReturnValue = $sthAddNewJob->execute($threadId, $logDateTime) or die "SP execution Failed: " . $sthAddNewJob->errstr;
		    
		# AutoUpdateJobDB.updateJobInfo(threadId, jobNumber, jobType, userId, accId, accName, fromDate, toDate);
        $dbReturnValue = $sthAddJobDetails->execute($threadId, $jobNumber, $jobType, $userId, $accId, 
        $accName, $fromDate, $toDate) or die "SP execution Failed: " . $sthAddJobDetails->errstr;
	}

	# Job Details Pattern from debug Log: It could be a new Job or an existing job. 
	if($logMessage =~ /.*?debug=(off|on).*?job#(.*?),jobType=(.*?),userId=(.*?),accId=(.*?),accName=(.*?),fromDate=(.*?),toDate=(.*?)\]/)
	{
		# print ("Debug Status Detected: \n");
	    $debugStatusMessage    = $1;
	    $jobNumber             = $2;
	    $jobType               = $3;
	    $userId                = $4;
	    $accId                 = $5;
	    $accName               = $6;
	    $fromDate              = $7;
	    $toDate                = $8;
		                    
	    $debugStatus = "false";
	    if($debugStatusMessage eq "on")
	    {
	    	$debugStatus = "true";
	    }
		
	    #var record:AutoUpdateRecord = AutoUpdateJobDB.getJobByJobNumber(jobNumber);
        $sthGetJobCountQuery->bind_param(1, $jobNumber);  # placeholders for argument numbered from 1
		$sthGetJobCountQuery->execute;
        my $recordCount = 0;
        while (my @row = $sthGetJobCountQuery->fetchrow_array) 
		{
			$recordCount = $row[0];
			# print "Another @row or $row[0]\n";
		}
		if($recordCount > 0)
		{
			# print("Job Found: JobNumber=$jobNumber ThreadId=$threadId\n");
		    # AutoUpdateJobDB.updateJobDebugStatus(threadId, jobNumber, debugStatus);
	        $dbReturnValue = $sthAddJobDebugStatus->execute($threadId, $jobNumber, $debugStatus) or die "SP execution Failed: " . $sthAddJobDebugStatus->errstr;
		        
        }
		else
		{
			# print ("Job NOT Found: Creating new job...JobNumber=$jobNumber ThreadId=$threadId\n");
            # AutoUpdateJobDB.setJobsThreadIdToNull(threadId);                
            $dbReturnValue = $sthRemoveThreadId->execute($threadId) or die "SP execution Failed: " . $sthRemoveThreadId->errstr;

		    # AutoUpdateJobDB.insertNewJob(threadId, logDate, logTime);
	        $dbReturnValue = $sthAddNewJob->execute($threadId, $logDateTime) or die "SP execution Failed: " . $sthAddNewJob->errstr;
		        

		    # AutoUpdateJobDB.updateJobInfo(threadId, jobNumber, jobType, userId, accId, accName, fromDate, toDate);
	        $dbReturnValue = $sthAddJobDetails->execute($threadId, $jobNumber, $jobType, $userId, $accId, 
	                               $accName, $fromDate, $toDate) or die "SP execution Failed: " . $sthAddJobDetails->errstr;
		        

		    # AutoUpdateJobDB.updateJobDebugStatus(threadId, jobNumber, debugStatus);
            $dbReturnValue = $sthAddJobDebugStatus->execute($threadId, $jobNumber, $debugStatus) or die "SP execution Failed: " . $sthAddJobDebugStatus->errstr;
		}
	}

    # Pattern for Data Directory of Job: Update Job Data Directory 
	if($logMessage  =~ /.*?About to run.*?job#(.*?),.*?dir=\/perfios\/data\/(.*?)\]/)
	{
		$jobNumber          = $1;
		my $dataDirectory   = $2;
		# AutoUpdateJobDB.updateJobDataDirectory(threadId, jobNumber, dataDirectory);
        $dbReturnValue = $sthAddDataDirectory->execute($jobNumber, $dataDirectory) or die "SP execution Failed: " . $sthAddDataDirectory->errstr;

		# print("Data Directory Detected: $dataDirectory\n");
	}

	# Patterns to check if any existing job has ended: Remove the thread ID of such jobs. 
	if($logMessage =~ /(.*?Request \/kv)|(MidnightJobs)|(Logout)|(New user registration)/)
	{
		if(!($logMessage =~ /\/kv\?FETCHACCTXS/))
		{
			# print("End Pattern Detected for threadId=$threadId\n");
		        
		    # AutoUpdateJobDB.setJobsThreadIdToNull(threadId);
            $dbReturnValue = $sthRemoveThreadId->execute($threadId) or die "SP execution Failed: " . $sthRemoveThreadId->errstr;
		}
	}

    # Append the Log Trail
    # AutoUpdateJobDB.appendLogTrail(threadId, line, logType);
    $dbReturnValue = $sthAddLogTrail->execute($threadId, $logType, $line) or die "SP execution Failed: " . $sthAddLogTrail->errstr;
}

sub getTimestamp
{
    my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);
    #printf "%4d-%02d-%02d %02d:%02d:%02d\n", $year+1900, $mon+1, $mday, $hour, $min, $sec;
    my $timestamp = sprintf("%4d-%02d-%02d %02d:%02d:%02d", $year+1900, $mon+1, $mday, $hour, $min, $sec);
    return $timestamp;
}