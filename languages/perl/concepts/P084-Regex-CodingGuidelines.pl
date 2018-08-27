# Description: Regular expressions Coding Guidelines

# A good regex involves
# 1. Matching what you want, but only what you want.
# 2. Keeping the regex manageable and understandable.
# 3. For an NFA, being efficient (creating a regex that leads the engine quickly to a match
#    or a non-match, as the case may be)
# 4. Personally, complex regex can be written in multiline using \x switch to for better
#    readability and maintainability.

my $string = "Test abcXYZ";

# Use /x switch in regex to use the following regex libraries
my $REGEX_TEXT = '
                  ^           # Starting of regex
                  Test        # Look for this text
                  \\s         # One space, \s has to be escaped in a variable but not in expression
                  abc         # And this text
                  .*          # Anything after that
                 ';

if ($string =~ m/$REGEX_TEXT/x) {
  print "Found\n";
} else {
  print "Not Found\n";
}

if ($string =~ m/
        ^               # At Beginning
        Test            # Test
        \s              # Space, here \s need NOT be escaped
        abc             # Test
        .*              # Anything after that
        /x
        ) {
  print "Found";
} else {
    print "Not Found";
}