# Description: Decorators

### Python Functions Makes Decorators Possible
* In Python, functions are the first class objects.
* Functions are objects and they can be referenced to, passed to a variable and returned from other functions as well.
* Functions can be defined inside another function and can also be passed as argument to another function.

### Decorators
* Decorators allows programmers to modify the behavior of function or class. 
* Decorators allow us to wrap another function in order to extend the behavior of wrapped function, without permanently 
  modifying it.
* In Decorators, functions are taken as the argument into another function and then called inside the wrapper function.
* Using decorators is also called metaprogramming as a part of the program tries to modify another part of the program 
  at compile time.
* Any object in Python which implements the special method __call__() is termed callable. Hence, in the most basic 
  sense, a decorator is a callable that returns a callable.
