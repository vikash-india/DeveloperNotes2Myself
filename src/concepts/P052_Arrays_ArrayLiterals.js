// Description: Array Literals in JavaScript

// Array Literals
// 1. An array literal is a pair of square brackets surrounding zero or more values separated by commas.
// 2. Array literals provide a very convenient notation for creating new array values.
// 3. An array literal can appear anywhere an expression can appear.
// 4. The first value will get the property name '0', the second value will get the property name '1', and so on.
// 5. Length of JavaScript arrays are not fixed. Hence, it can be extended.
// 6. Since the length of an array can be extended, there are no array bounds error. If an element with a subscript
//    that is greater than or equal to the current length is stored in an array, the length will increase to contain
//    the new element.
// 7. Element type of JavaScript arrays are not fixed. JavaScript Arrays can hold mixture of values.

// Example 1
var empty = []; // Empty array

console.log("empty[1]: " + empty[1]); // undefined
console.log("empty.length: " + empty.length); // 0

// Example 2
var numbers = [ 'Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine' ];

console.log("numbers[1]: " + numbers[1]); // One
console.log("numbers.length: " + numbers.length); // 10

// Example 3: Length of JavaScript arrays are not fixed and can be extended.
numbers[numbers.length] = "Ten"; // Adding an element at the end

console.log("Element added at the end: " + numbers[numbers.length - 1]); // Ten
console.log("numbers.length: " + numbers.length); // 11

// Example 4: Array length extends to accommodate the new element.
numbers[15] = "Fifteen"; // Adding element at any location
console.log("Element added at arbitrary position: " + numbers[numbers.length - 1]); // Fifteen
console.log("Other elements will be undefined: " + numbers[14]); // undefined
console.log("numbers.length: " + numbers.length); // 16

// Example 5: JavaScript Arrays can hold mixture of values
var miscellaneous_array = [ 'string', 3.14, true, false, null, undefined, NaN, Infinity, [ 'nested', 'array' ], {
    object : true
} ];

console.log("miscellaneous_array: " + miscellaneous_array);
console.log("miscellaneous_array.length: " + miscellaneous_array.length); // 10
