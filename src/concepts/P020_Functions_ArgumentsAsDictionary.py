# Description: Function With Variable Arguments as Dictionary

# Note
# 1. When a final formal parameter is **name, it receives a dictionary containing all keyword arguments except for the
#    formal parameters.
# 2. It may also have a formal parameter of the form *name which receives a tuple containing the positional arguments
#    after the formal parameter list.
# 3. The *name must occur before **name.
# 4. Example: Formal Parameters is studentName, Tuple containing parameters after studentName is *variableArguments,
#    **dictionary is the key-value pair.
def displayStudentRecords(studentName, *variableArguments, **dictionary):
    print("Student Name: ", studentName)

    # Accessing variable arguments tuple
    for argument in variableArguments:
        print(argument)

    # Accessing dictionary elements
    keys = sorted(dictionary.keys())    # The order in which the arguments are printed is undefined. Hence it is sorted.
    for key in keys:
        print(key, "\t:", dictionary[key])

    print("-" * 40)

# Calling function
displayStudentRecords("Vikash", "One", "Two", English = 80, Maths = 100, Science = 99)  # With formal parameter, tuple
                                                                                        # & dictionary
displayStudentRecords("Vikash", "One", "Two")                                           # Without dictionary.
displayStudentRecords("Vikash", English = 80, Maths = 100, Science = 99)                # Without tuple containing
                                                                                        # variable arguments
