# Description: Function With Variable Arguments

# Note
# 1. When we have a formal parameter of the form *name, it receives a tuple containing the positional arguments after
#    the formal parameter list.
# 2. The *name can have zero or more formal parameters before it.
# 3. Any formal parameters which occur after the *name parameter are 'keyword-only' arguments.
# 4. Eg. Formal Parameter is studentName, Tuple containing parameters is *variableArguments is keyword-only parameter.
def displayStudentRecords(studentName, classTeacher="None", *variableArguments):
    print("Student Name: ", studentName)

    # Accessing variable arguments tuple
    for argument in variableArguments:
        print(argument)

    print("Class Teacher: ", classTeacher)

    print("-" * 40)

# Calling function
displayStudentRecords("Vikash", "One", "Two", "Three", classTeacher="Norwig")   # Using formal parameter "Vikash".
                                                                                # Variable argument One, Two & Three.
                                                                                # Keyword-only parameter "Norvig"
displayStudentRecords("Vikash", "One", "Two", "Three", "Norwig")                # "Norvig" will be variable arguments
                                                                                # if keyword is not used.
displayStudentRecords("Vikash", "One", "Two")                                   # Tuple contains "One", "Two", "Three"
displayStudentRecords("Vikash")                                                 # No Variable argument after formal
                                                                                # parameter "Vikash".
