// Description: Operators in JavaScript

// Arithmetic Operators
var addition = 23 + 23;
var subtraction = 88 - 45;
var multiplication = 24 * 23;
var division = 81 / 25;                 // 3.24 since every number is represented by 64-bit floating point.
var remainder = 67 % 3;                 // 1. Modulo Division

// Assignment Operators
var assignment = 12;
assignment += 8;                        // Add and assign
assignment -= 8;                        // Subtract and assign
assignment *= 2;                        // Multiply and assign
assignment /= 2;                        // Divide and assign
assignment %= 5;                        // Modulo Division and assign

// Relational Operators
// 1. JavaScript Good Parts: Use === instead of == and use !== instead of !=
var equalTo = (4 + 4 == 8);             // true.
var equalToTwo = (4 + 4 == '8');        // true.
var exactEqualTo = (4 + 4 === 8);       // true. Both value and type should match
var exactEqualToTwo = (4 + 4 === "8");  // false.
var notEqualTo = (3 != 4);              // true.
var notEqualToTwo = (3 != '3');         // false.
var notExactEqualTo = (3 !== "3");      // true. Either value or type should NOT match.
var notExactEqualToTwo = (3 !== 3);     // false. Neither value nor type should match
var lessThan = (7 < 12);                // true.
var lessThanEqualTo = (4 + 4 <= 9);     // true.
var greaterThan = (9 > 20);             // false.
var greaterThanEqualTo = (12 >= 2 + 2); // true.
console.log(notEqualToTwo);

// Logical Operators
// 1. Always results in true or False
var notOperator = !true;
var orOperator = true || false;         // Also called default operator or short circuit OR operator
var andOperator = true && false;        // Also called guard operator or short circuit AND operator

// 2. !! will ALWAYS produce a Boolean value
result = !!"Vikash";

// Conditional Operator
// 1. variable = (condition) ? value1 : value2
var score = 40;
result = score > 70 ? "PASS" : "FAIL";
console.log(result);

// The + Operator on Strings
// 1. Concatenate two strings
var firstname = "Lionel";
var lastname = "Messi";
var name = firstname + lastname;

// 2. If one of the operand for + operator is a string, then string concatenation will occur instead of
//    addition.
name = name + 3;
console.log("Name:", name);

// 3. JavaScript Bad Parts: Loosely typed language should not have had operator like plus (+) symbol
//    overloaded.
result = +"42"; // 42
result = +"42" + (+"3"); // 45. Do not confuse +(+"3") as ++3

// Typeof Operator
// 1. The typeof operator is used to find out the object type.
// 2. The values produced by typeof are number, string, boolean, undefined, function, and object.
// 3. If the operand is an array or null, then the result is object, which is wrong.
console.log("Type Of:", typeof (name));

// Bitwise Operator
// 1. It is strange to have bitwise operators in a language like JavaScript which does not have Integer data
//    type.
// 2. The bitwise operator in JavaScript operates by converting the operand to a 32-bit signed integer,
//    performing bitwise operation on the operands and then converting the result back into a 64-bit bit
//    floating point number.
// 3. JavaScript bitwise computations are slow because of these to and fro conversions from floating point
//    number. Bitwise operator should be used only for bitwise computation and not for a faster computation
//    as done in C.
var a = 5;
var b = 13;
result = ~a;        // -6. NOT - Invert all the bits in a to get the 'result'.
result = a | b;     // 13. OR - The result bit will be 1 if the corresponding bit is 1 in either a or b
result = a & b;     // 5. AND - The result bit in 'result' will be 1 if the corresponding bit is 1 in
                    // both a and b
result = a ^ b;     // 8. XOR - The result bit will be 1 if the corresponding bit is 1 in either a or b
                    // but not both.
result = a >> b;    // 0. RIGHT SHIFT - Shift binary representation of 'a' by 'b' bits to the right &
                    // discard shifted bits.
result = a << b;    // 40960. LEFT SHIFT - Shift binary representation of 'a' by 'b' bits to the right,
                    // filling zeros.
result = a >>> b;   // 0. ZERO FILLED RIGHT SHIFT - Shift binary representation of 'a' by 'b' bits to the
                    // right, discarding bits shifted off, and shifting in zeros from the left.