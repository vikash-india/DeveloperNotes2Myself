# Description: This program explains how to read a directory

# Change to a specific directory
chdir("c:/temp") || die "Cannot cd to c:/temp ($!)";    # Chdir returns true if you've
                                                        # successfully changed to the requested
                                                        # directory and false otherwise

# The expansion of arguments like * or *.c into the list of matching filenames is called globbing.
# Perl supports globbing through a very simple mechanism - just put the globbing pattern between
# angle brackets or use the more mnemonically named glob function, like below
@a = <*.plx>;
@a = glob("*.plx");

# Directory handles are always opened read only; you cannot use a directory handle to change
# the name of a file or to delete a file.
opendir(NT, "c:/Temp") || die "Cannot opendir c:/temp: $!";

# Using list context. And then using the sort function to sort the file names.
# The list also include files that begin with a dot.
foreach $name (sort readdir(NT)) {
    print "$name\n";
}

# scalar context, one per loop
while ($name = readdir(NT)) {
    print "$name\n";
}

closedir(NT);
