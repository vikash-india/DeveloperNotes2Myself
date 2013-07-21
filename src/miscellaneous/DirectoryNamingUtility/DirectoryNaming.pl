# Perl Program to change the name of the folder
# 1. First Letter capital of each word
# 2. Curb All the extra spaces and just keep one
# 3. No space on either side of -
# 4. Add another string to the beginning or end of the Directory Name
# 5. Take the directory path as the command line arguments
# 6. No arguments means the current directory
# 7. Make an exe
# The nameing should be recursive based on the Switch or commandLine arguments etc
# If there is a single capital in between lower character then leave that character in upper case
# Remove _ and replace it with a single space

# Examples to test: 
# TestMessage.txt
# TESTNAME
# TEST MESSAGE.DTST
# TEST        TEST MMMMMMESSSAGE          -         Test.txt
# test message   -  1.txt

use Cwd;
    

# The Global Variables used in this programs
my $directoryPath				='';
my @originalDirectoryContents	='';
my @newDirectoryContents		='';

sub PrintUsage
{
    print "\nUsage: $0 [FullPathOfTheDirectory]\n\n";
    exit 0;
}

# Check if the Directory Path is entered or not
if ($#ARGV == 0) 
{
	$directoryPath = $ARGV[0];
}
else
{
	if ($#ARGV > 0) 
	{
		PrintUsage();
	}
	else
	{
		$directoryPath = getcwd;
	}
}
print "Path Entered: ".$directoryPath."\n\n";
print "The files in the directory are as follows:\n\n";
opendir(NT, $directoryPath) || die "Invalid Directory $directoryPath: $!";

# Read the Directory Contents in an array
@originalDirectoryContents = readdir(NT);
closedir(NT);

@originalDirectoryContents	= ("TestMessage.txt", "TESTNAME", "TEST MESSAGE.DTST", "TEST        TEST MMMMMMESSSAGE          -         Test.txt", "test message   -  1.txt");

# Loop through each directory content and rename it
foreach $originalName (@originalDirectoryContents) 
{
	$newName ='';
	print "Old Name: .$originalName.\t\t\tNew Name: .$newName.\n"; 

	# Check with multiple space and replace it with a single space
	#$originalName =~ 	s/RegExpr/$ReplaceString;

	# Do a convert of number

	# rename ("test", "New Folder");

}
