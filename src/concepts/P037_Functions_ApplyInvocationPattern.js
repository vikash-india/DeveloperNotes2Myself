// Description: The Apply Invocation Pattern

// The Apply Invocation Pattern
// 1. Since JavaScript is a functional object-oriented language, functions can have methods.
// 2. The apply method lets us construct an array of arguments to use to invoke a function.
// 3. It also lets us choose the value of 'this'.
// 4. The apply method takes two parameters,
//      - The first is the value that should be bound to 'this'.
//      - The second is an array of parameters.

// ------------------------------------------------- Example 1
// Make an array of 2 numbers and add them.
var array = [ 3, 4 ];

// Defining a function
function sum(x, y) {
    return x + y;
}

// Invoke the function using Apply Invocation Pattern
var result = sum.apply(null, array); // sum is 7

console.log("The Apply Invocation Pattern");
console.log("Example 1: result =", result);

// ------------------------------------------------- Example 2
// Make an object with a status member.
var Quo = function(string) {
    this.status = string;
};

// Give all instances of Quo a public method called get_status.
Quo.prototype.get_status = function() {
    return this.status;
};

// Create an object literal
var statusObject = {
    status : 'A-OK'
};

// Note: StatusObject does not inherit from Quo.prototype, but we can invoke the get_status method on statusObject
// even though statusObject does not have a get_status method.
var status = Quo.prototype.get_status.apply(statusObject); // status is 'A-OK'
console.log("Example 2: status =", status);