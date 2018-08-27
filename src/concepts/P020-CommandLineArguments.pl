# Description: This program explains how to parse command line arguments

sub PrintUsage {
    print "\nUsage: $0 [Arg 1] [Arg 2] [Arg 3] \n\n";
    exit 0;
}

if ($#ARGV < 2 ) {
    PrintUsage();
} else {
    print "The Arguments are: $ARGV[0]\t $ARGV[1]\t $ARGV[2]\n";
    print "The Arguments are: @ARGV\n";
}
