// Description: Comments in JavaScript

// Note
// 1. Multi-line comments can be created using /* and */
// 2. Single line comments can be created using //
// 3. JS Bad Parts: In JavaScript, /* and */ can also occur in regular expression literals, so block comments are not
//    safe for commenting out blocks of code. For example, following code will give error.
//    /*
//          var rm_a = /a*/.match(s);
//     */
// 4. JS Good Parts: As best practices, avoid /* */ comments & use // comments instead.

/*
 * This is an example of multi-line comment or block comment.
 * Multi-line comments can extend to multiple lines like this.
 */
console.log("Multiline comments should be put between /* and */");

// Single line comments can be created using //
console.log("Single line comments starts with //");
