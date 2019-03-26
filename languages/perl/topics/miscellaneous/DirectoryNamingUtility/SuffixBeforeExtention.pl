$string = "This i.s a test fileIt has new namestxt";


if ($string =~ m/\./) 
{
	print "TRUE";
}
else
{
	print "FALSE";
}

print $string;