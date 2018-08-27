// Description: Scope, Visibility and Lifetime of an Identifier in JavaScript

// 1. Visibility of an Identifier
//      - Visibility of an identifier determines the portions of the program in which it can be referenced.
// 2. Lifetime of an Identifier
//      - Lifetime of an identifier is the period during execution of a program in which an identifier exists
//        in memory. In other words, the storage duration of an identifier determines its lifetime.
// 3. Scope of an Identifier
//      - Scope in a programming language defines the visibility and lifetime of an identifier.
//      - Scope reduces naming collisions and provides automatic memory management.
// 4. Scope, Lifetime and Visibility in JavaScript
//      - A compilation unit contains a set of executable statements. In web browsers, each <script> tag
//        delivers a compilation unit that is compiled and immediately executed. Lacking a linker, JavaScript
//        throws them all together in a common global namespace.
//      - Lifetime of Global variables: Global variables are deleted when you close the page.
//      - Lifetime of Local Variables: Local variables are deleted when the function complete its execution.
//      - Functional Scope: All identifiers in JavaScript have FUNCTIONAL scope. In JavaScript, blocks do NOT
//        have scopes but functions have scopes. An identifier declared anywhere in a function is available
//        everywhere in the function.
//      - JavaScript Bad Parts: In many modern languages, it is recommended that variables be declared as late
//        as possible, at the first point of use. That turns out to be bad advice for JavaScript because it
//        lacks block scope. So instead, it is best to declare all of the variables used in a function at the
//        top of the function body.

// Define a function within a function
function demo() {
    var a = 3, b = 5;

    var bar = function() {
        var b = 7, c = 11;

        // At this point, a is 3, b is 7, and c is 11
        console.log("Location 1: a = " + a + ", b = " + b + ", c = " + c);

        a += b + c;

        // At this point, a is 21, b is 7, and c is 11
        console.log("Location 2: a = " + a + ", b = " + b + ", c = " + c);
    };
    // At this point, a is 3, b is 5, and c is not defined
    console.log("Location 3: a = " + a + ", b = " + b);

    bar();

    // At this point, a is 21, b is 5, and c is not defined
    console.log("Location 4: a = " + a + ", b = " + b);
};

// Call the function
demo();