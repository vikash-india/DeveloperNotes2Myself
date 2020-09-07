# Description: Sample Code to Run mypy

# Variables without types
i:int = 200
f:float = 2.34
str = "Hello"


# A function without type annotations
def greet(name:str)-> str:
    return str + " " + name


if __name__ == '__main__':
    greet("Dilbert")
