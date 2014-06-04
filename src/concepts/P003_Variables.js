// Description: Naming variables in JavaScript

// Note
//  1. A name is a letter optionally followed by one or more letters, digits, or underscores.
//  2. Names are used for statements, variables, parameters, property names, operators, and labels.
//  3. Variables are declared in JavaScript using the var keyword.
var variable = 1;
var variableCanBeginWithAnAlphabet = 2;
var _variableCanBeginWithAnUnderscore = 3;
var $variableCanBeginWithDollarSymbol = 4;
var variableShouldIdeallyStartWithALowerCase = 5;
var variableCannotStartWithANumber = 6;
var variableCanStoreStringWithinDoubleQuotes = "String Content Within Double Quotes";
var variableCanStoreStringWithinSingleQuotes = 'String Content Within Single Quotes';

// 4. CAPITAL letters can also be used while naming variables in certain situations.
var EULER_NUMBER = 2.71828;
var PI = 3.14159;

// 5. Assigning values to an undeclared JavaScript variables will automatically declare it as a GLOBAL variable.
variable1123 = 1;

// 6. If a variable is not assigned any value while declaring it, it will be 'undefined'.
var test; // undifined

// 7. Re-declaring JavaScript variables will NOT make it lose its value.
var name = "Messi";
var name;

// Print variable values
console.log(name);

// 8. Following reserved keywords cannot be used used as variable names
//    NOTE: NOT ALL RESERVED KEYWORDS ARE USED IN JAVASCRIPT. ONLY THE KEYWORDS IN PARANTHESIS ARE USED IN THE LANGUAGE
//    WHILE OTHERS ARE LEFT UNUSED.
//      A - abstract
//      B - boolean (break) byte
//      C - (case) (catch) char class const (continue)
//      D - debugger (default) (delete) (do) double
//      E - (else) enum export extends
//      F - (false) final (finally) float (for) (function)
//      G - goto
//      I - (if) implements import (in) (instanceof) int interface
//      L - long
//      N - native (new) (null)
//      P - package private protected public
//      R - (return)
//      S - short static super (switch) synchronized
//      T - (this) (throw) throws transient (true) (try) (typeof)
//      V - (var) volatile (void)
//      W - (while) (with)
//
// 9. The list does not include some words that SHOULD HAVE BEEN reserved but are not. Example,
//      - undefined
//      - NaN
//      - Infinity
//
// 10. It is not permitted to use a reserved word in the following
//      - As the name of an object property in an object literal.
//      - Or following a dot in a refinement.
