# Description: Comments in Perl

# Single Line Comments: Text from a "#" character until the end of the line is a comment,
# and is ignored. Exceptions include "#" inside a string or regular expression.
print "Hello World 1...\n";

# Multiline Comments:  Multiline comments in Perl is supported only thru POD

=head1 P002-Comments.pl

1. This is text that shows up with the "perldoc P002-Comments.pl" command.
2. The comment sections below do not.
3. =cut is used to signify the end of comment and start of code.

=cut

print "Hello World 2...\n";

=for comment

1. This is a single paragraph of comment text, spanning multiple lines.
2. It ends with the first blank line.
3. After that, the text can have other printed pod text shows up with perldoc.

4. This text also shows up with perldoc as it's not part of the "for" comment above.
5. =cut is used to get back to coding.

=cut

print "Hello World 3...\n";

=for comment
Another paragraph of comment text, spanning multiple lines. It ends with the first blank line.

=cut

print "Hello World 4...\n";

=begin comment
This is a multi-paragraph comment section. Which is terminated by an =end comment on a line by itself.

This is a second paragraph

=end comment

=cut

print "Hello World 5...\n";

=head2 Other pod documentation

This is text that also shows up with the "perldoc tstcmt.pl" command. The comment sections above do not.

=cut

print "Hello World 6...\n";