// Description: Functions in JavaScript

// Functions
// 1. Functions are the fundamental modular unit of JavaScript. Functions are used for code reuse, information hiding,
//    and composition. Functions are also used for specifying object behaviour.
// 2. Function Arguments
//      - Function can OPTIONALLY take arguments. Eg. x, y
//      - It is recommended to pass objects instead of MANY parameters to a functions to keep it clean and simple.
// 3. Return Values
//      - Function ALWAYS return value(s). If a return expression is NOT specified, then the return value will be
//        undefined.
//      - JavaScript does not allow a line end between the return and the expression.
// 4. Functional Scope
//      - A variable declared (using var) within a JavaScript function has LOCAL/FUNCTIONAL scope and can only be
//        accessed from within that function.
//      - Since variables have FUNCTIONAL scope, a variable declared anywhere in a function is available everywhere in
//        the function.
// 5. Function Invocation: The thing that is special about functions is that they can be invoked.

// Defining a function
function sum(x, y) {
    return x + y;
}

// Calling a function
s = sum(1, 2);
console.log("SUM:", s);

// Functions in JavaScript are Objects
// 1. Just like objects produced from object literals are linked to Object.prototype, function objects are linked
//    to Function.prototype which in turn is linked to Object.prototype.
// 2. Every function object is also created with a prototype property. Its value is an object with a constructor
//    property whose value is the function. This is distinct from the hidden link to Function.prototype.
// 3. Every function is also created with two additional hidden properties,
//      - The function's context and
//      - The code that implements the function's behaviour.
console.log("TODO: Example of Function objects!");

// JavaScript is a Functional Language
// 1. Since functions are objects, they can be used like any other value making them first class data types.
// 2. Functions can be stored in variables, objects, and arrays.
// 3. Functions can be passed as arguments to functions, and
// 4. Functions can be returned from functions.
// 5. Also, since functions are objects, functions can have methods.
console.log("TODO: Example of JavaScript as a Functional Language!");
