# Description: Named Tuples in Python

### Named Tuples
* Named Tuples are a type of container like dictionaries and they contain keys that are hashed to a particular value. 
  But on contrary, it supports both access from key value and iteration, which is missing in dictionaries.
* The 'namedtuples()' function is present in the module 'collection'. 

### Operations on Named Tuples
* Access Operations
    1. Access by index: The attribute values of namedtuple() are ordered and can be accessed using the index number 
       unlike dictionaries which are not accessible by index.
    2. Access by keyname: Access by keyname is also allowed as in dictionaries.
    3. Access Using getattr(): This is yet another way to access the value by giving namedtuple and key value as its 
       arguments.
* Conversion Operations
    1. _make(): This function is used to return a namedtuple() from the iterable passed as argument.
    2. _asdict(): This function returns the OrdereDict() as constructed from the mapped values of namedtuple().
    3. Using ** (double star) operator: This function is used to convert a dictionary into a namedtuple().
* Additional Operations
    1. _fields: This function is used to return all the keynames of the namespace declared.
    2. _replace(): This function is used to change the values mapped with the passed keyname.
