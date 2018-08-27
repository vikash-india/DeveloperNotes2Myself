// Description: The Constructor Invocation Pattern in JavaScript

// The Constructor Invocation Pattern
// 1. Functions that are intended to be used with the new prefix are called constructors. By convention, they
//    are kept in variables with a capitalised name. If a constructor is called without the new prefix, very
//    bad things can happen without a compile-time or runtime warning, so the capitalisation convention is
//    really important.
// 2. If a function is invoked with the new prefix, then a new object will be created with a hidden link to
//    the value of the function's prototype member, and 'this' will be bound to that new object.
// 3. The new prefix also changes the behaviour of the return statement. Check Inheritance examples for more
//    details.
// 4. JavaScript Bad Parts: Use of this style of constructor functions is not recommended.

// Create a constructor function called Quo. It makes an object with a status property.
var Quo = function(string) {
    this.status = string;
};

// Give all instances of Quo a public method called get_status.
Quo.prototype.get_status = function() {
    return this.status;
};

// Make an instance of Quo.
console.log("JavaScript Bad Parts: The Constructor Invocation Pattern should be avoided.");
var myQuo = new Quo("confused");

console.log(myQuo.get_status());    // confused
