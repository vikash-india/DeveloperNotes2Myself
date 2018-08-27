// Description: Array Creation in JavaScript

// Notes
// 1. An array is a linear allocation of memory in which elements are accessed by integers that are used to compute
//    offsets. Arrays can be very fast data structures. Unfortunately, JavaScript does not have anything like this kind
//    of array.
// 2. JavaScript provides an object that has some array-like characteristics. It converts array subscripts into strings
//    that are used to make properties of an object.
// 3. JavaScript arrays are significantly slower than a real array, but more convenient to use.
// 4. There are 3 different ways to create an array in JavaScript.

// Style 1: Creating array using array literals
var numbers = [ 'Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine' ];

console.log("Using array literal: " + numbers);
console.log("First Element: " + numbers[0]);

// Style 2: Creating array using the new operator
var numbers = new Array('Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine');

console.log("Using new operator: " + numbers);
console.log("Fourth Element: " + numbers[3]);

// Style 3: Creating array using a numeric argument to the array constructor
// If the only argument passed to the Array constructor is an integer between 0 and 2^32-1 (inclusive), this returns
// a new JavaScript array with length set to that number.
var arrayLength = 10;
var numbers = new Array(arrayLength);

numbers[0] = "Zero";
numbers[1] = "One";
numbers[2] = "Two";
numbers[3] = "Three";
numbers[4] = "Four";
numbers[5] = "Five";
numbers[6] = "Six";
numbers[7] = "Seven";
numbers[8] = "Eight";
numbers[9] = "Nine";

console.log("Using numeric argument to array constructor: " + numbers);
console.log("Last Element: " + numbers[9]);
