// Description: Difference between an Array and an Object in JavaScript

// Note
// 1. Arrays are objects in JavaScript. The first value will get the property name '0', the second value will get
//    the property name '1', and so on.
// 2. JavaScript Array inherits from Array.prototype, whereas JavaScript Object inherits from Object.prototype. Hence,
//    an array inherits a larger set of useful methods.
// 3. JavaScript Array gets the mysterious length property, while JavaScript Object does not.
// 4. When to use Arrays and when to use Objects: A common error in JavaScript programs is to use an object when an
//    array is required or an array when an object is required. The rule is simple: when the property names are small
//    sequential integers, you should use an array. Otherwise, use an object.
// 5. The JavaScript typeof operator reports that the type of an array as 'object' and cannot be used to distinguish
//    between an array and an object.

// Example of an array
var numbers_array = [ 'Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine' ];

console.log("numbers_array[1]: " + numbers_array[1]); // One
console.log("numbers_array.length: " + numbers_array.length); // 10. Length property is available

// Equivalent example of an object
// The number_object below is an object containing 10 properties, and those properties have exactly the same
// names and values as the number array above.
var numbers_object = {
    '0' : 'zero',
    '1' : 'one',
    '2' : 'two',
    '3' : 'three',
    '4' : 'four',
    '5' : 'five',
    '6' : 'six',
    '7' : 'seven',
    '8' : 'eight',
    '9' : 'nine'
};

console.log("numbers_object[1]: " + numbers_object[1]); // One
console.log("numbers_object.length: " + numbers_object.length); // undefined since length property is not available.

// Typeof Operator
var typeof_array = typeof numbers_array === 'object';
var typeof_object = typeof numbers_object === 'object';

console.log("Type of typeof_array is Object: " + typeof_array);
console.log("Type of numbers_object is Object: " + typeof_object);
