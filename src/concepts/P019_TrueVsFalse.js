// Description: True and False Values in JavaScript

// 1. Falsy values
//      - false
//      - null
//      - undefined
//      - The empty string ''
//      - The number 0
//      - The number NaN
// 2. Truthy values
//      - All other values are truthy, including true, the string 'false', and all objects.

var x = undefined;
if (x) {
    console.log("True");

} else {
    console.log("False");
}