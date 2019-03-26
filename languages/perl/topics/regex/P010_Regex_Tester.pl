################################################################################
# Description   : Test Perl Regular Expressions from a Regex Collection file.
# Author        : Vikash
# Known Issues  : None
# TODO          : Benchmarking regexes
#                   - It should work on all Perl Regex against a particular data
#                   - It should work on all Perl Regex against ALL data
################################################################################
use strict;
use Data::Dumper;
use Benchmark;

# Enter the regex file name
my $fileName = "P010_Regex_FileInput.txt";

# Config parameters
my $debugFlag = 0;                      # 0 - False or No, 1 - True or Yes
my $benchmarkRegexFlag = 0;             # 0 - False or No, 1 - True or Yes
my $benchmarkIterationCount = "10000";  # Number of iterations during benchmarking

main();
exit(1);

# Main thread of execution
sub main {
    # Get the content of the entire file
    my $content = getFileContent($fileName);

    # Parse content to get description, regex, matches data and non-matches data
    my ( $description, $regex, $matches, $nonMatches ) = parseData($content);

    # Parse regex content to get ONLY Perl regexes
    my %regexMap = parsePerlRegexes($regex);

    # Validate for at least one Perl regexes
    my $regexCount = scalar(keys %regexMap);
    die "No REGEX_PERL_XXX to apply\n" if $regexCount == 0;

    # Test all Perl regexes against MATCH data & display result
    testRegex( "Matches",     "MATCH",     $matches,    %regexMap );

    # Test all Perl regexes against NON-MATCH data & display result
    testRegex( "Non-Matches", "NOT-MATCH", $nonMatches, %regexMap );
}

sub debug_print {
    my $message = shift;
    if ($debugFlag) {
        print "$message\n";
    }
}

# Reads the contents of a file into a string and returns it
sub getFileContent {
    my $fileName = shift;

    # Open the data file and read the entire content in a string
    open( FILE, $fileName ) or die "Could not open file: $!";
    my $content = join( "", <FILE> );
    close FILE;

    # debug_print($content);

    return $content;
}

# Parse string content to segregate description, regex, matches & non-matches
sub parseData {
    my $content = shift;

    # Get Description, Regex, Match Data and Non-Match Data
    my ( $description, $regex, $matches, $nonMatches );
    if ( $content =~ m/
                  \#\s*Description\s*:?\s*(.*)\n.*\n    # Capture Description
                  \#\s*Regex\s*(.*)\n.*\n               # Capture Regex
                  \#\s*Matches\s*(.*)\n.*               # Capture Matches
                  \#\s*Non-Matches\s*(.*)\n.*           # Capture Non-Matches
                  \#\s*Notes
                 /gsx
        ) {
        $description = $1;
        $regex       = $2;
        $matches     = $3;
        $nonMatches  = $4;

        # debug_print("Description: #$description#");
        # debug_print("Regex To Match: #$regex#");
        # debug_print("Matches Data: #$matches#");
        # debug_print("Non-Matches Data: #$nonMatches#");
    } else {
        die ("One or more of Description, Regex, Matches or Non Matches
             missing!\n");
    }

    return ( $description, $regex, $matches, $nonMatches );
}

# Parses a string containing all regexes to indentify ONLY Perl regexes
# Perl regexes have the pattern REGEX_PERL_...
sub parsePerlRegexes {
    my $regex = shift;

    my (@regexList, %regexMap);
    my @regexList = $regex =~ m/(REGEX_PERL.*?)\s*=\s*(.*?)(?=REGEX_|$)/gs;
    %regexMap = @regexList;

    # debug_print ("Parsed PERL regexes:");
    # debug_print ( Dumper(\@regexList)); # Dumper take references
    # debug_print ( Dumper(\%regexMap));

    return %regexMap;
}

# Test all perl regex against the data and displayes the result
sub testRegex {
    my ( $description, $expectedResult, $inputStrings, %regexHash ) = @_;

    print "------------------------ Testing for $description";
    my @inputLines = split( '\n', $inputStrings );

    foreach my $key (keys(%regexHash)) {
        my $regex = $regexHash{$key};
        print "\nTesting $key \n";
        foreach my $string (@inputLines) {
            my $regexResult;
            if ( $string =~ m/$regex/sx ) {
                $regexResult = "MATCH";
            } else {
                $regexResult = "NOT-MATCH";
            }
            my $result = $expectedResult eq $regexResult ? "SUCCESS" : "FAIL";
            print "$result: Expected = $expectedResult, Actual = $regexResult,",
                  " Data = $string\n";

            my $benchmarkTime = 0;
            if ( $benchmarkRegexFlag == 1 and $result eq "SUCCESS" ) {
                $benchmarkTime = benchmarkRegex($string, $regex);
                print "Benchmark: ", timestr($benchmarkTime), "\n\n";
            }
        }
    }
    print "\n";
}

sub benchmarkRegex {
    my ( $string, $regex ) = @_;
    my $benchmarkTime = timeit($benchmarkIterationCount,  sub { $_ = $string; /$regex/sx; });
    # print "Benchmark:", timestr($benchmarkTime), "\n";

    return $benchmarkTime;
}

__END__
