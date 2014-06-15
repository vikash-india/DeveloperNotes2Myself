// Description: Objects in JavaScript

// Objects
// 1.  Object: An object is a collection of mutable properties.
// 2.  Property: A property is a pair consisting of a NAME and a VALUE.
// 3.  Name: A property name can be any string, including an empty string.
// 4.  Value: A property value can be any JavaScript value except 'undefined'.
// 5.  Everything in JavaScript is an Object - String, Number, Array, Functions etc.
// 6.  Immutable Objects
//      - Objects that CANNOT be modified after it has been created is called immutable objects.
//      - Numbers, strings and booleans are IMMUTABLE objects.
// 7.  Mutable Objects
//      - An object whose properties can be modified are called mutable objects.
//      - Arrays, functions, regular expressions etc are MUTABLE objects.
// 8.  Methods
//      - Methods are actions that can be performed on objects.
//      - Object can have Methods.
// 9.  Objects in JavaScript are class-free.
// 10. Prototype Linkage: JavaScript includes a prototype linkage feature that allows an object to inherit the
//     properties of another object. This can significantly reduce object initialisation time and memory
//     consumption.

// String Object
var name = "Messi";
console.log("Property Length:", name.length);
console.log("Method toUpperCase():", name.toUpperCase());