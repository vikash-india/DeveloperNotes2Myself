// Description: Augmenting Types in JavaScript

// 1. JavaScript allows the basic types of the language to be augmented.
// 2. Adding a method to Object.prototype makes that method available to all objects.
// 3. This also works for functions, arrays, strings, numbers, regular expressions, and booleans.
// 4. By augmenting Function.prototype with a method, we no longer have to type the name of the prototype property.
//    That bit of ugliness can now be hidden.
// 5. By augmenting the basic types, we can make significant improvements to the expressiveness of the language.
//    Because of the dynamic nature of JavaScript's prototypal inheritance, all values are immediately endowed with
//    the new methods, even values that were created before the methods were created.

// By augmenting Function.prototype, a method is available to all functions.
Function.prototype.method = function(name, func) {
    this.prototype[name] = func;
    return this;
};

// Adding an integer method to Number.prototype

// JavaScript lacks a method that removes spaces from the ends of a string
String.method('trim', function() {
    return this.replace(/^\s+|\s+$/g, '');
});
console.info('"' + "   neat   ".trim() + '"');

// 1. The prototypes of the basic types are public structures, so care must be taken when mixing libraries. One
//    defensive technique is to add a method only if the method is known to be missing.
// 2. Add a method conditionally.
// 3. Another concern is that the for in statement interacts badly with prototypes. Use the hasOwnProperty method
//    to screen out inherited properties.
Function.prototype.method = function(name, func) {
    if (!this.prototype[name]) {
        this.prototype[name] = func;
    }
};
