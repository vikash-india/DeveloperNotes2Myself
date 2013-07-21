# Global Variables
my $newsFileInput 	= "News.html";
my $newsFileOutput 	= "News.xml";
my $viewsFileInput	= "Views.html";
my $viewsFileOutput	= "Views.xml";

# Processing News File
open(IN_NEWS, "$newsFileInput") 	|| die "Error open: $!";	
open(OUT_NEWS, ">$newsFileOutput")	|| die "Error open: $!";

print OUT_NEWS '<?xml version="1.0" encoding="ISO-8859-1"?>'."\n";
print OUT_NEWS '<news>';

# Creating the XML
while (<IN_NEWS>)
{
	chomp;
    if ($_ =~ m/<td.*?>(.*?)<\/td/igs)
    {
    	my $line = $1;
    	#print "Line: $line\n";
    	
    	# Image Part
    	if ($line =~ /img.*?src="(.*?)"/)
    	{
    		print OUT_NEWS '<new><imagepath>'.$1.'</imagepath>'."\n";
    	} 
    	else 
    	{
    		if ($line =~ /href/) 
    		{
    				
    		} else {
    			print OUT_NEWS '<new><imagepath></imagepath>'."\n";
    		}
    	}
    	if ($line =~ /href="(.*?)" .*_blank">(.*)<\/a/)
    	{
    		print OUT_NEWS '<linkURL><![CDATA['.$1.']]></linkURL>'."\n";
    		print OUT_NEWS '<linkvalue><![CDATA['.$2.']]></linkvalue>'."\n";
    		print OUT_NEWS '</new>'."\n";
    	}
    }
}
print OUT_NEWS '</news>';

close(IN_NEWS);
close(OUT_NEWS);

# Process Views File
open(IN_VIEWS, "$viewsFileInput") 		|| die "Error open: $!";	
open(OUT_VIEWS, ">$viewsFileOutput")	|| die "Error open: $!";

print OUT_VIEWS '<?xml version="1.0" encoding="ISO-8859-1"?>'."\n";
print OUT_VIEWS '<views><view>';

# Creating the XML
while (<IN_VIEWS>)
{
	chomp;
	#print "Line: $_\n";
    if ($_ =~ m/<td.*?href="(.*?)".*?_blank">(.*?)<\/a>.*<\/td/igs)
    {
    	
    	my $linkURL = $1;
    	my $linkValue = $2;
    	print "Line: $_\n";
    	
		print OUT_VIEWS '<link>';
    	print OUT_VIEWS '<linkURL><![CDATA['.$linkURL.']]></linkURL>'."\n";
    	print OUT_VIEWS '<linkvalue>'.$linkValue.'</linkvalue>'."\n";
    	print OUT_VIEWS '</link>'."\n";
    }
}
print OUT_VIEWS '</view></views>';

close(IN_VIEWS);
close(OUT_VIEWS);


print "Done";