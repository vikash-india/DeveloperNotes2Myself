# Description: Unpacking Argument List During a Function Call

# Function expecting formal parameters
def function_with_formal_parameters(student_name, math_code = 101, physics_code = 201):
    print(student_name, math_code, physics_code)

# At times, the arguments are already in a list or tuple but need to be unpacked for a function call requiring separate
# positional arguments.Functions calls can be made with *-operator to unpack the arguments out of a list or tuple.
student_record = ["Vikash", 201, 301]
function_with_formal_parameters (*student_record)

# Functions calls can be made with **-operator to unpack the arguments out of a dictionary
subject_dictionary = {"student_name": "Vikash", "math_code": 201, "physics_code": 301}
function_with_formal_parameters(**subject_dictionary)
