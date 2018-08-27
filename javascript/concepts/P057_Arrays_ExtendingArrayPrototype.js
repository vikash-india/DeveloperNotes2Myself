// Description: Extending all arrays by extending Array Prototype in JavaScript

// Note
// 1. JavaScript provides a set of methods for acting on arrays. These methods are functions stored in Array.prototype.
// 2. Array.prototype can be augmented to add custom array functionality.
// 3. Adding a function to Array.prototype, makes it available to every array.

// Adding a method to Array.prototype to extend all arrays.
Array.prototype.reduce = function(f, value) {
    var i;
    for (i = 0; i < this.length; i += 1) {
        value = f(this[i], value);
    }

    return value;
};

// A sample array of numbers
var data = [ 4, 8, 15, 16, 23, 42 ];

// A function to add two numbers.
var add = function(a, b) {
    return a + b;
};

// A function to multiple two numbers.
var mult = function(a, b) {
    return a * b;
};

// Invoke the data's reduce method, passing in the add function.
var sum = data.reduce(add, 0); // The sum is 108

// Invoke the reduce method again, this time passing in the multiply function.
var product = data.reduce(mult, 1); // The product is 7418880

console.log("sum: " + sum);
console.log("product: " + product);
