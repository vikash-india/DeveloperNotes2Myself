// Description: Strings in JavaScript

// Strings
// 1. A string literal can be wrapped in single quotes or double quotes.
// 2. It can contain zero or more characters.
// 3. The \ (backslash) is used to escape characters.
// 4. All characters in JavaScript are 16 bits wide because JavaScript was built at a time when Unicode was a
//    16-bit character set.
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
// 1. The escape sequences allow for inserting characters into strings that are not normally permitted, such
//    as backslashes, quotes, and control characters.
// 2. Some common escape sequences used in JavaScript are as follows
//    +-------------------------------------------------------------------------------------------------+
//    | Escape Sequence      Unicode Character      Character                                           |
//    +-------------------------------------------------------------------------------------------------+
//    | \n                   \u000A                 Newline                                             |
//    | \"                   \u0022                 ASCII Apostrophe (")                                |
//    | \'                   \u0027                 ASCII Apostrophe (')                                |
//    | \`                                          ASCII Grave Accent / Backtick (`)                   |
//    | \\                   \u005C                 backslash (\)                                       |
//    | \t                   \u0009                 Tab                                                 |
//    | \b                   \u0008                 Backspace                                           |
//    | \nnn                                        Character with given octal code (1, 2 or 3 digits)  |
//    | \xnn                                        Character with given hex code (1 or 2 hex digits)   |
//    | \unnnn                                      Unicode character with given code (1--4 hex digits) |
//    | \Unnnnnnnn                                  Unicode character with given code (1--8 hex digits) |
//    +-------------------------------------------------------------------------------------------------+

var char2 = "\u0041"; // The \u convention allows for specifying character code points numerically

// String Methods & Properties
// 1. Strings have a length property. For example, "seven".length is 5.
// 2. Strings are immutable.
// 3. But it is easy to make a new string by concatenating other strings together with the + operator.
// 4. Two strings containing exactly the same characters in the same order are considered to be the same
//    string. Eg 'c' + 'a' + 't' === 'cat'.
string7 = 'c' + 'a' + 't';
string8 = "cat";
console.log(string7 === string8);