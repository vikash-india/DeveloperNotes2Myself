// Description: The Method Invocation Pattern in JavaScript

// The Method Invocation Pattern
// 1. When a function is stored as a property of an object, it's called a method.
// 2. When a method is invoked, 'this' is bound to the object which contains the method.
// 3. If an invocation expression contains a refinement (that is, a . dot expression or [subscript] expression), it is
//    invoked as a method.
// 4. A method can use 'this' to access the object to retrieve values from the object or to modify the object.
// 5. The binding of 'this' to the object happens at invocation time. This very late binding make functions that use
//    'this' highly reusable.

// Example: An object with 'value' & an increment method.
var anObject = {
    value : 0,
    increment : function(inc) {
        this.value += typeof inc === 'number' ? inc : 1;
    }
};

console.log("The Method Invocation Pattern");
anObject.increment();
console.log(anObject.value); // 1 because inc = undefined

anObject.increment(2);
console.log(anObject.value); // 3 because inc = 2
