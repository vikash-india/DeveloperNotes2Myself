// Description: Strings in JavaScript

// Strings
// 1. A string literal can be wrapped in single quotes or double quotes.
// 2. It can contain zero or more characters.
// 3. The \ (backslash) is used to escape characters.
// 4. JavaScript was built at a time when Unicode was a 16-bit character set, hence all characters in JavaScript are
//    16 bits wide.
var string1 = "Hello World";
var string2 = 'Hello World';
var string3 = 'He said, "How about this?"';
var string4 = "He said, \"How about this?\"";
var string5 = "Isn't it?";
var string6 = 'Isn\'t it?';

// Character Data Type
// 1. JavaScript does not have a character data type. Any string with one character can be used instead.
var char1 = 'A';

// Escape sequence
// 1. The escape sequences allow for inserting characters into strings that are not
//    normally permitted, such as backslashes, quotes, and control characters.
// 2. Escape sequences are double quote("), single quote('), backslash(\), slash(/), backspace(b), formfeed(f),
//    new line(n), carriage return(r), tab(t) and 4 hexadecimal digits(u).
var char2 = "\u0041"; // The \u convention allows for specifying character code points numerically


// String Methods & Properties
// 1. Strings have a length property. For example, "seven".length is 5.
// 2. Strings are immutable.
// 3. But it is easy to make a new string by concatenating other strings together with the + operator.
// 4. Two strings containing exactly the same characters in the same order are considered to be the same string.
//    Eg 'c' + 'a' + 't' === 'cat'.
string7 = 'c' + 'a' + 't';
string8 = "cat";
console.log(string7 === string8);
