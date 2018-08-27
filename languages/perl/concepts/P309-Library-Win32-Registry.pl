# Description: Using Win32::Registry module to read registery keys
use Win32::Registry;

#my $Register = "Software\\Microsoft";
my $Register = "Software\\Microsoft\\Command Processor";
my $hkey;

# Open the registry for a particular key
$HKEY_LOCAL_MACHINE->Open($Register, $hkey)|| die $!;

# Get all the keys as a list under that key
$hkey->GetKeys(\@key_list);
foreach $key (@key_list) {
    print "$key\n";
}

# Get the values for a particular key
$hkey->GetValues(\%values);
print "\nGetting the values\n";
foreach $value  (keys (%values)) {
    $RegType 	= $values{$value}->[1];
    $RegValue 	= $values{$value}->[2];
    $RegKey 	= $values{$value}->[0];

    print "$RegType    $RegValue    $RegKey\n";
}

# Close the Registry
$hkey->Close();
