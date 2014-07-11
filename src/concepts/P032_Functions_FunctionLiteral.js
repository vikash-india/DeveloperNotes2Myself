// Description: Anatomy of a Function in JavaScript

// A function literal has four parts.
// 1. Keyword: The first part is the reserved word function.
// 2. Function Name
//      - The OPTIONAL second part is the function's name.
//      - The function can use its name to call itself recursively. The name can also be used by debuggers and
//        development tools to identify the function.
//      - ANONYMOUS FUNCTIONS:   If a function is not given a name it is callen an anonymous function.
// 3. Parameters
//      - The third part is the set of parameters of the function, wrapped in parentheses. Within the parentheses
//        is a set of zero or more parameter names, separated by commas. These names will be defined as variables in
//        the function.
//      - Unlike ordinary variables, instead of being initialised to undefined, they will be initialised to the
//        arguments supplied when the function is invoked.
// 4. Function Body
//      - The fourth part is a set of statements wrapped in curly braces. These statements are the body of the function.
//      - Function body is executed when the function is invoked.
console.log("TODO: Add an appropriate example of a typical function here.");

// Anonymous Function: A variable add containing a function which adds two numbers.
var add = function(a, b) {
    return a + b;
};

// Closure
// - The function object created by a function literal contains a link to that outer context. This is called closure.
// - Closure is the source of enormous expressive power.
console.log("TODO: Add an appropriate example of a closure.");

// Notes
// 1. A function literal can appear anywhere that an expression can appear.
