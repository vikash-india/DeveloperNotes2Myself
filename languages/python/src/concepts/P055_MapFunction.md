# Description: Map Function in Python

### Map Function
* The map() function returns a list of the results after applying the given function to each item of a given iterable 
  like list, tuple etc.
* The general syntax is `map(function, iterable)` where
    - function: It is a function to which map passes each element of given iterable.
    - iterable: It is an iterable which is to be mapped.
    - **Returns**: The function returns an object that can be converted to any iterable type.

### Advantages of Map Function
* Map function may be microscopically faster in some cases (when you're NOT making a lambda for the purpose, but using  
  the same function in map and a listcomp). List comprehensions may be faster in other cases and most (not all)  
  pythonistas consider them more direct and clearer.
* List comprehension is preferred over Map as it is more obvious to new programmers. However if a function is already 
  defined, it is often reasonable to use map. 
