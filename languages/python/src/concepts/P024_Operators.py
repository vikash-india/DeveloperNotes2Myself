# Description: Operators in Python

# Mathematical Operators (Unary Operators)
unaryAddition           = +9
unarySubtraction        = -9

# Mathematical Operators
addition                = 23 + 23
subtraction             = 88 - 45
multiplication          = 24 * 23
division                = 81 / 25           # 3.24
remainder               = 67 % 3            # 1. Modulo Division
truncatingDivision      = 25 // 3           # 8. Truncates the decimal portion of the result
power                   = 3 ** 4            # 81. 3 raised to the power of 4

# Mathematical Operators(Increment & Decrement Operators): Not available in Python
increment = 1
++increment                                 # Pre-increment Operators. Does nothing. But does not give errors though
#increment++                                # Post-increment Operators. Gives Error.
--increment                                 # Pre-decrement Operators. Does nothing. But does not give errors though
#increment--                                # Post-decrement Operators. Gives Error.
# Note: Same thing can be achieved with assignment Operators += and -=

# Bitwise Operators
bitwiseOr               = 1 | 2             # Binary 1 OR 10 = 11 = 3
bitwiseAnd              = 1 & 2             # Binary 1 AND 10 = 00 = 0
bitwiseNot              = ~ 7               # Binary NOT 1 = 1 =. Same as -x - 1 = -7 - 1 = -8. Check Notes Below
bitwiseXOR              = 1 ^ 2             # Binary Exclusive OR ie XOR = 01 ^ 10 = 11 = 3
leftShift               = 7 << 1            # Binary 7 ie 111 becomes 1110 ie 14. Same as multiplying x by 2**y = 7 * (2 ** 1)
rightShift              = 4 >> 1            # Binary 2 ie 100 becomes 10 ie 2. Same as dividing x by 2**y = 4 // (2 ** 1)

# Note
# 1. Two's complement: Write the number in binary. Invert the digits. Add one to it.
# 2. Negative Numbers are represented as 2's complement in computers.
# 3. Python represents a binary number with infinite series

# Ternary Operator
print('{0} is {1} Prime.'.format(13, '' if 13 else 'NOT'))
'' if 13 else 'NOT'

# Relational Operators: Shows relation between two similar items by comparing
equalTo                 = (4 + 4 == 8)      # Also used for string.
notEqualTo              = (3 != 7)          # Also used for string.
lessThan                = (7 < 12)          # Also used for string.
lessThanEqualTo         = (4 + 4 <= 9)      # Also used for string.
greaterThan             = (9 > 20)          # Also used for string.
greaterThanEqualTo      = (12 >= 2 + 2)     # Also used for string.

# Ternary Operator
'true' if True else 'false'

# Logical Operators: Always results in true or False
notOperator             = not True
orOperator              = True or False
andOperator             = True and False

# Assignment Operators
assignment              = 12
assignment              += 8                # Add and Assign
assignment              -= 8                # Subtract and Assign
assignment              *= 2                # Multiply and Assign
assignment              /= 2                # Divide and Assign
assignment              //= 2               # Truncate Divide and Assign
assignment              **= 3               # Power and Assign
assignment              %= 5                # Modulo Division and Assign
assignment              = int(assignment)   # Shift assignment operators only work for Integers
assignment              <<= 2               # Left Shifts and Assign
assignment              >>= 2               # Right Shifts and Assign

# Print the result
print("Result\t:", increment)
print("AA < AB:", "AA" < "AB")
