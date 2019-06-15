# Description: Named Tuples Functions

# Note
# 1. The number 19071979 is called the Duke's prime because John Wayne was born in 1907 and died in 1979.
# 2. The number 31121999 (in the DD/MM/YYYY format) is the last day of the second millennium to be a prime number.
# 3. The number 25122011 is the first prime 21st century Christmas Day in DD/MM/YYYY format.

from collections import namedtuple

# Declare Named Tuple
Student = namedtuple('Student',['name','age','DOB'])

# Add values
S = Student('Dilbert','40','19071979')

# Access the values
print ("The Student name using index:", S[0])                                   # Access using index
print ("The Student age using index:", S[1])                                    # Access using index
print ("The Student DOB using index:", S[2])                                    # Access using index

print()
print ("The Student name using keyname:", S.name)                               # Access using name
print ("The Student age using keyname:", S.age)                                 # Access using name
print ("The Student DOB using keyname:", S.DOB)                                 # Access using name

print()
print ("The Student name using getattr():", getattr(S,'name'))                  # Access using getattr()
print ("The Student age using getattr():", getattr(S,'age'))                    # Access using getattr()
print ("The Student DOB using getattr():", getattr(S,'DOB'))                    # Access using getattr()


# Initialise Data
list_data = ['Catbert', '20', '31121999']                                       # Initializing iterable
dictionary_data = {'name' : "Dogbert", 'age' : 8 , 'DOB' : '25122011'}          # Initializing dictionary

# Create named tuples using _make()
print()
print ("The Named Tuple instance using iterable:", Student._make(list_data))

# Use _asdict() method to return an OrderedDict()
print ("The OrderedDict instance using namedtuple:", S._asdict())

# Use ** operator to return namedtuple from a dictionary
print ("The namedtuple instance from dict:", Student(**dictionary_data))

# Use _fields to display all the keynames of named tuple
print ("All the fields of students:", S._fields)

# Use _replace() to change the attribute values of named tuple
print ("The modified namedtuple:", S._replace(name = 'Asok'))
