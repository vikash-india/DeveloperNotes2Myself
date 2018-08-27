# Description: Calling Function With Keyword Arguments

def display_subject_code(student_name, math_code = 101, physics_code = 201):
    print(student_name, math_code, physics_code)


display_subject_code("Vikash")                                      # Call function using POSITIONAL arguments.
display_subject_code(student_name = "Vikash", physics_code = 302)   # Calling function with KEYWORDS arguments.
display_subject_code(math_code = 302, student_name = "Vikash")      # Order of keywords does not matter.
display_subject_code("Vikash", physics_code = 302)                  # POSTITIONAL and KEYWORDS can be mixed together.

# Following function calls will be INVALID
#display_subject_code()                                              # Required argument missing.
#display_subject_code(physics_code = 302, "Vikash")                  # POSITIONAL argument after a KEYWORD argument.
#display_subject_code("Vikash", student_name = "Krishna")            # Duplicate value for the argument student_name.
#display_subject_code(chemistry_code='401')                          # Unknown keyword argument.
