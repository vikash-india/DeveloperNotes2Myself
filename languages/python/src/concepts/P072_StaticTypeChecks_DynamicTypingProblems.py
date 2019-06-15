# Description: Problems With Dynamic Type Checks

# Note
# 1. This program works perfectly if the name is entered, but CRASHES if the name is left blank.
# 2. The problem in this code is that default_name isn't a string - it's a Dictionary. So calling get_first_name on
#    default_name fails horribly because it doesn't have a split() function.

def get_first_name(full_name):
    return full_name.split(" ")[0]

default_name = {
    "first_name": "User First Name",
    "last_name": "User Last Name"
}

user_name = input("Please enter your name: ")
first_name = get_first_name(user_name)

# If the user didn't type anything in, use the default name
if not first_name:
    first_name = get_first_name(default_name)

print(f"Hi, {first_name}!")
