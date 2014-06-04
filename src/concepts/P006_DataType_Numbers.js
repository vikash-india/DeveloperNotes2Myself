// Description: Numbers in JavaScript

// TODO:
// 1. Understand Infinity and -Infinity in more details.

// Note
// 1. JavaScript has only one number type & every number is represented internally as 64-bit floating point.
// 2. 64-bit floating number in JavaScript is equivalent to Java's double.
// 3. Since there is no separate integer types, 1 and 1.0 are the same value.
// 4. Storing numbers as 64-bit floating precision also avoids overflow problems in short integers.
// 5. A large class of numeric type errors (Eg. problems of overflow in short integers) is avoided completely.

var number1 = 0;
var number2 = 1;
var number3 = -1;
var number4 = -103.234;
var number5 = -1.03e4;
var number6 = -1.03e-4;

// JavaScript special number: NaN
// 1. The value NaN is a number value that is the result of an operation that cannot produce a normal result.
// 2. NaN is not equal to any number including itself
// 3. NaN can be detected using the function isNaN(number).
var number7 = NaN;
var result = isNaN(number7);

// JavaScript special number: Infinity
// 1. Infinity represents all values greater than 1.79769313486231570e+308
// 2. -Infinity represents all values lesser than -1.79769313486231570e+308
var positiveInfinity = 1.79769313486231570E+308 * 10; // 1.79769313486231570e+309
var negativeInfinity = -1.79769313486231570E+308 * 10; // -1.79769313486231570e+309;
var number8 = Infinity;
var number9 = -Infinity;

console.log(number9);
