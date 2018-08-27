# Description: Taking user input into an array

print "Enter values..press Ctrl-Z to stop \n";
@array_Input = <STDIN>;

print "You entered the following values\n";
print @array_Input;
print "Last element is @array_Input[$#array_Input]";
