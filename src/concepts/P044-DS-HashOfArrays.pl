# Description: Complex data structure can be created using lists and hashes

# Hash of Lists
my %HoAEntityFields	= (
    Mickey	=> [ "Disney", "Mouse", "RED"],
    Donald  => [ "Disney", "Duck", "YELLOW", "More", 12345]
);

print $HoAEntityFields{Mickey}->[0]."\n";
print $HoAEntityFields{Donald}->[1]."\n";