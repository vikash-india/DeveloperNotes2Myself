# Description: Static Type Checking in Python

### Static Type Checking
* Static type checking is available from Python 3.6 onwards with some sane syntax.
* Static type checking is optional.
* Static Type for Functions
    - Use Union type to declare a function that can accept multiple types.
    - Use Any type to declare a function that can accept anything.
* Python 3.6 also supports some of the fancy typing stuff like generic types and custom user-defined types.
    - Read about it in [Python Type Support](https://docs.python.org/3/library/typing.html)

### Running the Type Checker
* While Python 3.6 gives a syntax for declaring types, there’s absolutely nothing in Python itself yet that does 
  anything with these type declarations. To actually enforce type checking, do one or both of of two things, namely,
    - Download the open-source mypy type checker and run it as part of your unit tests or development workflow.
    - Use PyCharm which has built-in type checking in the IDE.
