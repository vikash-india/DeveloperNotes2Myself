$string = "this is a test message";
@array = split / /, $string;
$newName = '';

foreach $string (@array) 
{
	print $string."\n";
	$temp = ucfirst($string);
	if (length $newName == 0) 
	{
		$newName = join '', $newName,$temp;
	}
	else
	{
		$newName = join ' ', $newName,$temp;
	}
}
print $newName;
