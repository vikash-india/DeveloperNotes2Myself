# Description: This program explains various files tests available in Perl
use File::stat;

$fileName = "026-Addresses";

# Check for existence of a file
if (-e $fileName) {
    print "File already exists $fileName\n";
} else {
    print "New file can be be created as the file does not exists\n";
}

# Check for existence of multiple files
if (-e "index.html" && -e "index.cgi") {
    print "Both the files exists\n";
}

# Check for existence of a directory
if (-d $fileName) {
    print "$fileName is a Directory\n";
} else {
    print "$fileName is NOT a Directory\n";
}

# Check if the file is an executable
if (-x $fileName) {
    print "$fileName is executable\n";
}

# Getting file properties using stat function
$fileOwner = stat($fileName)->uid;
print "Owner: $fileOwner\n";
