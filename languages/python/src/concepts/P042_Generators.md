# Description: Generators in Python

### Generators
* Generators are a simple, clean and efficient way of creating iterators.

### Terminologies
1. Generator Function: A generator-function is like a normal function, but whenever it needs to generate a value, it
   does so using the yield keyword instead of return keyword. Alternatively, If the body of a function contains yield,
   the function automatically becomes a generator function.
2. Generator Object: Generator functions return a generator object. Generator objects are used either by calling the
   next method on the generator object or using the generator object in a loop.
3. Generator Expression: Generator expression creates an anonymous generator function.

### Advantages of Generators
1. Easy to Implement
2. Memory Efficient
3. Represent Infinite Stream
4. Pipelining Generators