// Description: Statements in JavaScript

// Semicolon
// 1. Semicolon separates JavaScript statements.
// 2. Semicolons are optional. Code on a single line is a valid statement in JavaScript.
var i = 0;
var m = 11 // Perfectly valid even without a semicolon
console.log("m:", m);

// Multiple Statements
// 1. Multiple statements can be written on a single line using semicolons
var j = 0;
var k = 1; // Same as var j = 0; var k = 1;
console.log("i, j, k: ", i, j, k);

// Statement Blocks
// 1. Statements can be grouped together using curly braces
// 2. Unlike many other languages, blocks in JavaScript do not create a new scope, so variables should be defined
//    at the top of the function, not in blocks.
var l = 0;
{
    var l = 2;
    l = l + 1;
    console.log("l:", l);
}
// Surprise, Surprise! Variable in JavaScript are in global namespace
console.log("l:", l); // Prints 3 instead of 0

// Multiline Statements
// 1. A statement in JavaScript can be split into multiple lines using \. Extra white spaces are ignored.
var sentence = "A quick brown fox jumps \
right over the lazy dog.";
console.log(sentence);
