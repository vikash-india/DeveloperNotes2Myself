# Description: This programs demonstrates different types of scalars / data types

# Float Literal
$floatVar1 = 1.25;	    # about 1 and a quarter
$floatVar2 = 7.25e45;   # 7.25 times 10 to the 45th power (a big number)
$floatVar3 = -6.5e24;	# negative 6.5 times 10 to the 24th(a "big" negative number)
$floatVar4 = -12e-24;	# negative 12 times 10 to the -24th (a very small negative number)
$floatVar5 = -1.2E-23;	# another way to say that

# Integer Literal
$integerVar1 = -2004;				    # Any negative Integer
$integerVar2 = 3485;				    # Any Positive number
$integerVar3 = 123456789012345;		    # This is the longest digit that will remain as integer
$integerVar4 = 12345678901234567890;    # This will get converted to Float

# Octal Numbers
$OctalVar1 = 0234;					    # Octal numbers starts from 0

# Hexadecimal Numbers
$HexaVar1 = 0x1A;						# Hexa numbers starts from 0x or OX

print "Float Values are:\n";
print "$floatVar1\n";
print "$floatVar2\n";
print "$floatVar3\n";
print "$floatVar4\n";
print "$floatVar5\n\n";

print "Integer Values are:\n";
print "$integerVar1\n";
print "$integerVar2\n";
print "$integerVar3\n";
print "$integerVar4\n\n";

print "Octal Numbers are:\n";
print "$OctalVar1\n\n";					# While printing, it prints the decimal value.

print "Hexadecimal Numbers are:\n";
print "$HexaVar1\n";					# While printing, it prints the decimal value.
print hex($HexaVar1);
