// Description: The Try-Catch-Finally Construct in JavaScript

// Note
// 1. The try statement lets can be used to test a block of code for errors.
// 2. The catch statement can be used to handle the error.
// 3. The finally statement, if defined, will be executed regardless of whether an error occur in the try
//    block or not.
// 4. The catch clause defines a new variable that will receive the exception object.
// 5. There cannot be multiple catch clause because there are no classes (like Java). So a switch statement
//    within the ONLY catch block can be used to decide on the error type.

try {
    callSomeUndefinedFunction();
    console.log('After undefined function call');

} catch (exception) {
    console.log('An exception occurred: ' + exception.message);

} finally {
    console.log('The code in finally block is ALWAYS executed irrespective of the above outcome.');
}

console.log("Code execution continues after try-catch-finally block.");