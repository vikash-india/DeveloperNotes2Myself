# Description: Using Documentation Strings

# Conventions about the content and formatting of documentation strings.
# 1. The first line should always be a short, concise summary of the object's purpose.
# 2. For brevity, it should not explicitly state the object's name or type, since these are available by other means
#    (except if the name happens to be a verb describing a function's operation).
# 3. This line should begin with a capital letter and end with a period.
# 4. If there are more lines in the documentation string, the second line should be blank, visually separating the
#    summary from the rest of the description.
# 5. The following lines should be one or more paragraphs describing the object's calling conventions, its side
#    effects, etc.
def my_function():
    """Do nothing, but document it.

    No, really, it doesn't do anything.
    """
    pass

# Calling the function
print (my_function())
