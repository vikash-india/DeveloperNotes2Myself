# Description: Sample Code to Run mypy

# Variables without types
i = 200
f = 2.34
str = "Hello"


# A function without type annotations
def greet(name):
    return str + " " + name


if __name__ == '__main__':
    greet("Dilbert")
