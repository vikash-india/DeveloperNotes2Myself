// Description: Scope and lifetime of a variable in JavaScript

// Lifetime
// 1. The lifetime of a JavaScript variable starts as soon as they are declared.

// Scope of local variables
// 1. Local variables are deleted when the function complete its execution.

// Scope of global variables
// 1. Global variables are deleted when you close the page.

// Variables in JavaScript have FUNCTIONAL scope
// - In JavaScript, blocks do not have scopes but functions have scopes. So a variable declared anywhere in a
//   function is available everywhere in the function.

// Note
// 1. A compilation unit contains a set of executable statements. In web browsers, each <script> tag delivers a
//    compilation unit that is compiled and immediately executed. Lacking a linker, JavaScript throws them all together
//    in a common global namespace.
