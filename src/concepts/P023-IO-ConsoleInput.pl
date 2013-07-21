# Description: This program explains how to take a user input and print it to console

print "What is your name? ";
$name = <STDIN>;
chomp $name;						# Remove \n from the end of input if present
print "Hello, $name!\n";