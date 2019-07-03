# Description: Object Oriented Programming in Python

### Python OOP Terminologies
* Class: A user-defined prototype for an object that defines a set of attributes that characterize any object of the 
  class. The attributes are data members (class variables and instance variables) and methods, accessed via dot 
  notation.
* Class variable: A variable that is shared by all instances of a class. Class variables are defined within a class but 
  outside any of the class's methods. Class variables are not used as frequently as instance variables are.
* Data member: A class variable or instance variable that holds data associated with a class and its objects.
* Function overloading: The assignment of more than one behavior to a particular function. The operation performed 
  varies by the types of objects or arguments involved.
* Instance variable: A variable that is defined inside a method and belongs only to the current instance of a class.
* Inheritance: The transfer of the characteristics of a class to other classes that are derived from it.
* Instance: An individual object of a certain class. An object obj that belongs to a class Circle, for example, is an 
  instance of the class Circle.
* Instantiation: The creation of an instance of a class.
* Method: A special kind of function that is defined in a class definition.
* Object: A unique instance of a data structure that's defined by its class. An object comprises both data members 
  (class variables and instance variables) and methods.
* Operator overloading: The assignment of more than one function to a particular operator.

### Python Garbage Collection
* Python deletes unneeded objects (built-in types or class instances) automatically to free the memory space.
* Python's garbage collector runs during program execution and is triggered when an object's reference count reaches 
  zero.
* An object's reference count increases when it is assigned a new name or placed in a container (list, tuple, or 
  dictionary). The object's reference count decreases when it's deleted with del, its reference is reassigned, or its 
  reference goes out of scope. When an object's reference count reaches zero, Python collects it automatically.

### Classes
* Every Python class keeps following built-in attributes and they can be accessed using dot operator like any other 
  attributes
```
- __dict__  : Dictionary containing the class's namespace.
- __doc__   : Class documentation string or none, if undefined.
- __name__  : Class name.
- __module__: Module name in which the class is defined. This attribute is "__main__" in interactive mode.
- __bases__ : A possibly empty tuple containing the base classes, in the order of their occurrence in the base class 
              list.
```
    
* Instead of using the normal statements to access attributes, use the following functions
```
  - The getattr(obj, name[, default])   : To access the attribute of object.
  - The hasattr(obj, name)              : To check if an attribute exists or not.
  - The setattr(obj, name, value)       : To set an attribute. If attribute does not exist, then it would be created.
  - The delattr(obj, name)              : To delete an attribute.
```

### Inheritance
* Use issubclass() or isinstance() functions to check a relationships of two classes and instances.
* The issubclass(sub, sup) boolean function returns true if the given subclass sub is indeed a subclass of the 
  superclass sup.
* The isinstance(obj, Class) boolean function returns true if obj is an instance of class Class or is an instance of a 
  subclass of Class.

### Overloading
* Base Overloading Methods: Following are some generic functionality that can be overridden in a class
```
__init__( self [,args...] )     : Constructor (with any optional arguments). Eg Sample Call : obj = className(args)
__del__( self )                 : Destructor, deletes an object. Eg Sample Call : del obj
__repr__( self )                : Evaluable string representation. Eg Sample Call : repr(obj)
__str__( self )                 : Printable string representation. Eg Sample Call : str(obj)
__cmp__( self, x )              : Object comparison. Eg. Sample Call : cmp(obj, x)
```

### Encapsulation
* Using OOP in Python, one can restrict access to methods and variables. 
* This prevents data from direct modification which is called encapsulation. 
* In Python, private attribute is denoted using underscore as prefix ie single (_) or double (__).

### Constructor
* Class functions that begins with double underscore (__) are called special functions as they have special meaning.
* The __init__() function: This is a special function which gets called whenever a new object of that class is 
  instantiated.
* This type of function is also called constructors in Object Oriented Programming (OOP). It is normally used to 
  initialize all the variables.

### Multiple Inheritance in Python
* Like C++, a class can be derived from more than one base classes in Python. This is called multiple inheritance.
* In multiple inheritance, the features of all the base classes are inherited into the derived class. The syntax for 
  multiple inheritance is similar to single inheritance.

### Multilevel Inheritance in Python
* One can also inherit form a derived class. This is called multilevel inheritance. It can be of any depth in Python.
* In multilevel inheritance, features of the base class and the derived class is inherited into the new derived class.

### Method Resolution Order in Python
* Every class in Python is derived from the class object. It is the most base type in Python.
* Technically, all other class, either built-in or user-defines, are derived classes and all objects are instances of 
  object class.

### Python Operator Overloading
* One can change the meaning of an operator in Python depending upon the operands used. This practice is known as 
  operator overloading.
* Operator Overloading Special Functions in Python

| Operator              | Expression    | Internally            |
|-----------------------|---------------|-----------------------|
| Addition              | p1 + p2       | p1.__add__(p2)        |
| Subtraction           | p1 - p2       | p1.__sub__(p2)        |
| Multiplication        | p1 * p2       | p1.__mul__(p2)        |
| Power                 | p1 ** p2      | p1.__pow__(p2)        |
| Division              | p1 / p2       | p1.__truediv__(p2)    |  
| Floor Division        | p1 // p2      | p1.__floordiv__(p2)   |
| Remainder (modulo)    | p1 % p2       | p1.__mod__(p2)        |
| Bitwise Left Shift    | p1 << p2      | p1.__lshift__(p2)     |
| Bitwise Right Shift   | p1 >> p2      | p1.__rshift__(p2)     |
| Bitwise AND           | p1 & p2       | p1.__and__(p2)        |
| Bitwise OR            | p1 | p2       | p1.__or__(p2)         |
| Bitwise XOR           | p1 ^ p2       | p1.__xor__(p2)        |
| Bitwise NOT           | ~p1           | p1.__invert__()       |

### TODO
* Python Shallow Copy and Deep Copy
* Python Iterators
* [Special Method Names](https://docs.python.org/3/reference/datamodel.html#special-method-names)
