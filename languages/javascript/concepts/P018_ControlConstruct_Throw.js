// Description: The Throw Construct in JavaScript

// Note
// 1. The throw statement allows us to create custom errors/exceptions.
// 2. The custom exception can be a JavaScript String, Number, Boolean or an Object.
// 3. If the throw statement is in a try block, then control goes to the catch clause. Otherwise, the function
//    invocation is abandoned, and control goes to the catch clause of the try in the calling function.
// 4. The expression is usually an object literal containing a name property and a message property.
// 5. The catcher of the exception can use that information to determine what to do.

var input = NaN;
try {
    if (input == null)
        throw {
            name : 'Null!',
            message : 'Null values encountered!'
        };

    if (input == undefined)
        throw "Undefined!";

    if (input == "")
        throw "Empty!";

    if (isNaN(input))
        throw "Not a number!";

    if (input == 0)
        throw "Zero!";

    if (input > 0)
        throw "Positive Number!";

    if (input < 5)
        throw "Negative Number!";

    // Finally
    throw input + " Not a Number!";

} catch (exception) {
    console.log("Exception: " + exception);     // Full Exception Object
    console.log(exception.name);                // ErrorType

}

// TODO:
// - Understand all FALSY values like null, undefined 0 and '' in the above code.