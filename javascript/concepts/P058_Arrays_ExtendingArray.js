// Description: Extending an Array in JavaScript

// Note
// 1. Since an array is really an object, methods can be added directly to an individual array instead of the
//    array.Prototype.

var data = [ 4, 8, 15, 16, 23, 42 ];

// Adding a method to Array.prototype to extend all arrays.
Array.prototype.reduce = function(f, value) {
    var i;
    for (i = 0; i < this.length; i += 1) {
        value = f(this[i], value);
    }

    return value;
};

// A function to add two numbers.
var add = function(a, b) {
    return a + b;
};

// Add a total function to the data array. This function extends ONLY the data array.
data.total = function() {
    return this.reduce(add, 0);
};

// Invoke the total function.
total = data.total(); // total is 108
console.log("total: " + total);