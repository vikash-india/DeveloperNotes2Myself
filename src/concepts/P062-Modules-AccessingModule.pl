# Description: Accessing a user defined module

use P062MyModule;                                   # MyModule is defined in file P052MyModule.pm

$var1 = MyModule::hoot("Argument1 Argument2");
print "Return Value: $var1";
