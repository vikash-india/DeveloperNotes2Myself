#########################################################################################################################
# Purpose		: This utility creates directories that needs to test the DirectoryContentsRenaming Utility
# Author		: Vikash
# Date			: 5/18/2006
# Arguments		: None
# Known Bugs	: None
#########################################################################################################################

@originalDirectoryContents = 
	(
		'                                           LeadingSpace',
		'TrailingSpace                                          ',
		'           LeadingAndTrailingSpaces                    ',
		'     Multiple     paces        In        Between      ',
		'capitalizeFirstCharacterOfThisLineWithoutChangingAnythi',
		'SpaceBeforeHyphen                                -1.txt',
		'SpaceAfterHyphen-                                 1.txt',
		'SpaceOnBothSidesofHyphen               -          1.txt',
		'No-Space-Before-Or-After-Hyphen-In-This-Example-1.txt',
		'12343423434324322312sdfsdf143243firstCharacterIsANumber',
		'A VeryQuick Brown Fox Jumps Right Over The Lazy Dog.mp3',
		'A VERYQUICK BROWN FOX JUMPS RIGHT OVER THE LAZY DOG.MP3',
		'a veryquick brown fox jumps right over the lazy dog.mp3',
		'a_veryquick_brown_fox_jumps_right_over_the_lazy_dog.mp3',
		'[  all@In          One[Exa%!mple    -   Tes@@@###t.txt ]',
		'This is a test file that needs to be done properly.txt'
		);

foreach $directory (@originalDirectoryContents) 
{
	mkdir $directory || die "Could not create directory: $!\n\n";
}