# Description: Executing system/shell commands from Perl

`notepad C:\\test.txt`;                # Method 1
exec 'notepad C:\\test.txt';           # Method 2
system 'notepad C:\\test.txt';         # Method 3

print "Executed the system/shell command\n";
