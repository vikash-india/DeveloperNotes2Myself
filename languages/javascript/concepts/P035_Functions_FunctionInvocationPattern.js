// Description: Function Invocation Pattern in JavaScript

// The Function Invocation Pattern
// 1. When a function is not the property of an object, then it is invoked as a function.
// 2. When a function is invoked with this pattern, 'this' is bound to the global object.

function sum(a, b) {
    return a + b;
}
var result = sum(3, 4); // sum is 7. Function Invocation

// Inner Functions
//  - Functions can be defined inside of other functions.
//  - An inner function of course has access to its parameters and variables.
//  - An inner function also enjoys access to the parameters and variables of the functions it is nested
//    within.
//  - Binding 'this' to global object was a mistake because inner function cannot refer to the outer object
//    and share the method's access to the object.
//  - WORKAROUND: The method defines a variable and assigns it the value of this, the inner function will have
//    access to this through that variable. By convention, the name of that variable is 'that'.

anObject = {
    value : 3
};

anObject.double = function() {
    var that = this;                                // Workaround.
    var helper = function() {
        that.value = sum(that.value, that.value);
    };
    helper();                                       // Invoke helper as a function.
};

// Invoke double as a method.
console.log("The Function Invocation Pattern");
anObject.double();
console.log(anObject.value);                        // 6