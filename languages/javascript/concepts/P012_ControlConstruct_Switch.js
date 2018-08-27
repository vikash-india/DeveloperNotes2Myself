// Description: Switch Construct in JavaScript

// Note
// 1. The break keyword is used to prevent the code from running into the next case automatically.
// 2. The default keyword is to specify a case if no condition matches.
// 3. The default keyword section is optional.
// 4. Falsy values
//      - false
//      - null
//      - undefined
//      - The empty string ''
//      - The number 0
//      - The number NaN
// 5. Truthy Values: Everything else is true.
// 6. The switch expression can produce a number or a string.
// 7. A case clause contains one or more case expressions. The case expressions need not be constants.
var i = 5;
var message;
switch (i) {
    case 1:
        message = "One";
        break;
    case 2:
        message = "Two";
        break;
    default:
        message = "Default";
}