######################################################################
#
# Description: Reads Perfios Mailer Template and the content 
# from different .txt file and generates equivalent .html 
# 
######################################################################
use strict;

my $mailerTemplateFileName  = "_Perfios_Mailer_Template.html";

# Reading the Perfios Mailer Template File in a string
open(IN, "$mailerTemplateFileName") || die "Error open: $!";
my $mailerTemplateContent = join("", <IN>); 
close(IN);
# print $mailerTemplateContent;

# Read the Current Directory and Generate Mailers
opendir(DIR,".") || die "Cannot opendir c:/temp: $!";
foreach my $name (sort readdir(DIR)) 
{ 
    # Process only .txt files
    if($name =~ /\.txt$/)   
    {
        # print "$name\n";
    
        # Get the File Name of .txt and create corresponding .html file
        $name =~ /(.*)\.txt$/;
        my $fileName = $1;
        $fileName = $fileName.".html";
        
#        if (-e $fileName) 
#        {
#            print "$fileName already exists. Skipping this file\n";
#        } 
#        else 
#        {
            # Reading the content of this mailer
            open(IN, "$name") || die "Error open: $!";
            my $mailerBody = join("", <IN>);
            close(IN);
      
            # Replace $PERFIOS_MAILER_CONTENT with content
            my $generatedMailer = $mailerTemplateContent;
            $generatedMailer =~ s/\$PERFIOS_MAILER_CONTENT/$mailerBody/is;

            open(OUT, ">$fileName");  # For writing the file
            print OUT $generatedMailer;
            close(OUT);
            
            print "New file can be be created as the file does not exists\n";
#        }
    }
}

exit(0);
