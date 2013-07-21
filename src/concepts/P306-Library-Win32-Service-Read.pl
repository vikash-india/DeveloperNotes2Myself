# Description: Using Win32::Service module to check all available services
use Win32::Service;

my %hashref = ();
Win32::Service::GetServices("192.168.1.1", \%hashref);

# Another example of Keys
foreach $key (keys %hashref) {
  print "$key-------->$hashref{$key}\n";
}

@array1 = keys(%hashref);
print @array1;


