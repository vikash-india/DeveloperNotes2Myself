#######################################################################################################
# Description: Test Script
# Notes: 
#       1. 
#       2.  
#######################################################################################################
use strict;

my %hash = ();
 
$hash{ '2009-01-29' } = 'kubera.29-01-2009.log'; 
$hash{ '2011-01-29' } = 'kubera.29-01-2011.log'; 
$hash{ '2010-01-29' } = 'kubera.29-01-2010.log'; 


foreach my $key (sort keys %hash)
{
  # do whatever you want with $key and $value here ...
  my $value = $hash{$key};
  print "$key ----> $value\n";
}
