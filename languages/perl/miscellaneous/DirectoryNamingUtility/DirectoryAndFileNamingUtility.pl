#########################################################################################################################
# Purpose		: This utility renames files and directories according to some standard rules
# Author		: Vikash
# Date			: 5/18/2006
# Arguments		: DirectoryAndFileNamingUtility AbsolutePathOfTheDirecotory
# Known Bugs	: 1. Symbols are replaced first and then symbols are removed. 
#########################################################################################################################
use Cwd;

# Configurable Switches
$REMOVE_LEADING_SPACES			= "YES";
$REMOVE_TRAILING_SPACES			= "YES";
$REMOVE_MULTIPLE_SPACES			= "YES";
$REMOVE_SPACES_FROM_HYPHEN		= "YES";
$CAPITALIZE_NAME				= "YES";
$ADD_SUFFIX						= "YES";
$ADD_PREFIX						= "YES";
$LOWER_CASE_EXTENTION			= "YES";


$SUFFIX							= "_SUFFIX";
$PREFIX							= "PREFIX_";
%STRINGS_TO_BE_REPLACED =	(
								'#'		=> '',
								'\['	=> '',
								']'		=> '',
								'%!'	=> '='
							);
@STRINGS_TO_BE_REMOVED			= ("@", "#");

# Global Variables
my $directoryPath				='';
my @originalDirectoryContents	='';
#my @newDirectoryContents		='';

# Functions & Subroutines
sub PrintUsage
{
    print "\nUsage: $0 [Absolute Path Of The Directory]\n\n";
    exit 0;
}

# Command Line Arguments validation
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
# print "Path Entered: ".$directoryPath."\n\n";

# Read the directory contents
opendir(DIRECTORY_HANDLE, $directoryPath) || die "Error: $directoryPath--> $!";
@originalDirectoryContents = readdir(DIRECTORY_HANDLE);
closedir(DIRECTORY_HANDLE);

# print "The directory contents are:\n\n";
#@originalDirectoryContents = 
#	(
#		'                                           LeadingSpace',
#		'TrailingSpace                                          ',
#		'           LeadingAndTrailingSpaces                    ',
#		'     Multiple     paces        In        Between      ',
#		'capitalizeFirstCharacterOfThisLineWithoutChangingAnythi',
#		'SpaceBeforeHyphen                                -1.txt',
#		'SpaceAfterHyphen-                                 1.txt',
#		'SpaceOnBothSidesofHyphen               -          1.txt',
#		'No-Space-Before-Or-After-Hyphen-In-This-Example-1.txt',
#		'12343423434324322312sdfsdf143243firstCharacterIsANumber',
#		'A VeryQuick Brown Fox Jumps Right Over The Lazy Dog.mp3',
#		'A VER QUICK BROWN FOX JUMPS RIGHT OVER THE LAZY DOG.MP3',
#		'a ver quick brown fox jumps right over the lazy dog.mp3',
#		'a_ver quick_brown_fox_jumps_right_over_the_lazy_dog.mp3',
#		'[  all@In          One[Exa%!mple    -   Tes@@@###t.txt ]'
#	);


# Apply regular expresssions rules to each of the directory contents
foreach $originalName (@originalDirectoryContents) 
{
	$newName = $originalName;

	# Replace underscore(_)(if any) with a single space
	$newName  =~ s/_+/ /g;

	# Remove all multiple spaces(if any) with single space
	$newName  =~ s/\s+/ /g;

	# Remove the space from the either side of - symbol(if any)
	$newName  =~ s/\s*-\s*/-/g;

	# Remove the leading spaces(if any)
	$newName  =~ s/\s+\b//;

	# Remove the trailing spaces(if any)
	$newName  =~ s/\b\s//;

	foreach $key (keys %STRINGS_TO_BE_REPLACED)
	{ 
		$searchString	= $key ;
		$replaceString	= $STRINGS_TO_BE_REPLACED{$key};
		$newName  =~ s/$searchString/$replaceString/g;
		# print "At $key ----> $STRINGS_TO_BE_REPLACED{$key}\n";
	}

	# Remove Symbols from the list(if any)
	foreach $symbol (@STRINGS_TO_BE_REMOVED) 
	{
		$newName  =~ s/$symbol//g;
	}
	
	# Last Logic: Split based on space, capitalize and then join the names
	@arrayOfStrings = split / /, $newName;
	$newName = '';
	foreach $string (@arrayOfStrings)	
	{
		$string = ucfirst($string);
		if (length $newName == 0) 
		{
			$newName = join '', $newName,$string;
		}
		else
		{
			$newName = join ' ', $newName,$string;
		}
	}
	
	# Convert the first character to the upper case
	$newName = ucfirst($newName);

	# Add prefix
	if ($ADD_PREFIX =~ /YES/i) 
	{
		$newName = $PREFIX.$newName;
	}
	

	# Add suffix just before the extention
	if ($newName =~ m/\./) 
	{
		@arrayOfStrings = split /\./, $newName;
		$extention = pop @arrayOfStrings;
		$newName = '';
		foreach $string (@arrayOfStrings) 
		{
			if (length $newName == 0) 
			{
				$newName = join '', $newName,$string;
			}
			else
			{
				$newName = join '.', $newName,$string;
			}
			$newName = $newName.$SUFFIX.".".$extention;
		}
	}
	else
	{
		$newName = $newName.$SUFFIX;
	}

	print "Original: .$originalName.\t\t\tNew Name: .$newName.\n";
	# Rename the directory contents
	# Test if the destination exists then keep adding 1 and keep checking and then create a directory
	rename ($originalName, $newName); # Handle error

}
__END__
############################################################Logic Applied############################################################
# Command Line Argument	: The directory path should be provided as the command line arguments. 
# Command Line Argument	: If no command line arguments is provided then it should default to current directory
# Regular Expression	: First Letter capital of each word
# Regular Expression	: Replace multiple spaces with a single spaces
# Regular Expression	: Remove spaces on the either side of hyphen(-)
# Regular Expression	: Add a prefix to the newly generated name
# Regular Expression	: Add a suffix to the newly generated name just before the file extention
# Regular Expression	: Remove Leading spaces
# Regular Expression	: Remove Trailing Spaces
# Regular Expression	: Replace under score with space
# Regular Expression	: Remove all the symbols configured by the user
# Regular Expression	: Replace one symbol with another as configured by the user(This should run before the Symbols to be removed
# Regular Expression	: Replace Underscore with a single space
# Regular Expression	: 
# Regular Expression	: 
# Directory Naming		: The target name already existing
# Check for Suffix
# Check for prefix
# Check for Multiple dots in the extentions
############################################################Logic Applied############################################################


#############################################################Test Cases##############################################################
# Command Line Arguments			: More than one arguments
# Command Line Arguments			: Exact One arguments
# Command Line Arguments			: No arguments
# Check for Directory Contents		: Whether all files are read or not
# STRINGS_TO_BE_REPLACED			: No Symbols configured. Hash is smpty
# STRINGS_TO_BE_REPLACED			: Mutliple characters replaced by a single character
# STRINGS_TO_BE_REPLACED			: Single character replaced by multiple characters
# STRINGS_TO_BE_REPLACED			: One Character replaced by nothing(removed)
# STRINGS_TO_BE_REPLACED			: Multiple characters replaced by nothing(removed)
# Directory
# Capitalized						: 
#############################################################Test Cases##############################################################


############################################################Enhancements############################################################
# The whole function should be recurrsive
# If there is a single capital in between lower character then leave that character in upper case
# Check for the switch and then apply the regular expression
# Create some file types and then check
# Create a combination of file types and directories and then test
# A warning input saying that it will rename all the files in the directories mentioned in the path
############################################################Enhancements############################################################
