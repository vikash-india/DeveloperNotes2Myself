// Description: Primitive data types in JavaScript

// Note
// 1. JavaScript has DYNAMIC types i.e. same variable can be used as different types
var x; // Here x is undefined
var x = 5; // Now x is a number
var x = true; // Now x is a boolean
var x = "John"; // Now x is a string

// 2. 'Nothing' or empty values: undefined and null.
var y; // When a variable is not initialised, it is undefined.
x = null; // Variables can be emptied by setting its value to null.
x = undefined; // Variables can also be emptied by setting the value to undefined.

// 3. JavaScript Booleans
// - Possible values are true or false.
var response = true;
var response = false;

// 4. JavaScript Numbers
var i = 10;
var i = 1.234;
var i = 1.23e10;
var i = 1.23e+10;
var i = 1.23e-10;
var i = 1.23E-10;

// 5. JavaScript Strings
// - Strings are values within single or double quotes
var name = "Messi"; // Within double quotes
var name = 'Ronaldo'; // Within single quotes
var sentence = "That's it!"; // Single quotes inside double quoted string
var sentence = 'He asked, "What are you doing?"'; // Double quotes inside single quoted string
var escapedCharacters = 'He asked, \'What are you doing?\''; // Escape single quotes inside single quoted strings

// 6. JavaScript Arrays
// - Array indexes are zero-based
var persons = new Array();
persons[0] = "Messi";
persons[1] = "Xavi";
persons[2] = "Ronaldo";
var persons = new Array("Messi", "Xavi", "Ronaldo"); // Condensed way
var persons = new Array("Messi", "Xavi", "Ronaldo"); // Literal Array

// 7. JavaScript Objects:
// - An object is delimited by curly braces.
// - Inside the braces the object's properties are defined as name and value pairs (name : value).
// - The properties are separated by commas
var person = {
    firstname : "Lionel",
    middlename : "Andres",
    lastname : "Messi",
    id : 5566
};

// - Addressing Objects
name = person.middlename;
name = person["middlename"];

// Declaring Variable Types: While declaring a new variable, its type can also be declared using the "new" keyword.
// JavaScript variables are all objects. When you declare a variable you create a new object.
var name = new String;
var x = new Number;
var response = new Boolean;
var persons = new Array;
var person = new Object;

console.log(i);
