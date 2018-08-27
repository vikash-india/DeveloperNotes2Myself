#######################################################################################################
# Description: References of Hash
# Notes: 
#       1. 
#       2.  
#######################################################################################################
my %hashVar;
$hashVar{"1"} = 5;
$hashVar{"2"} = 6;
$hashVar{"3"} = 7;
      
sub testMethod
{
    my $hashRef = shift;
    for my $var ( keys %$hashRef )
    {
        print "$var->$hashRef->{$var}\n";
    }
}

testMethod(\%hashVar)