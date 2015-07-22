// Description: Object Prototypes in JavaScript

// Prototype-based Programming
// 1. Prototype-based programming is a style of object-oriented programming in which classes are not present,
//    and behaviour reuse (inheritance) is performed via a process of cloning existing objects that serve as
//    a prototype.
// 2. JavaScript includes a prototype linkage feature that allows one object to inherit the properties of
//    another object. This feature, if used well, can reduce objects initialisation time & memory consumption.
// 3. Object.prototype is an object that comes standard with JavaScript.
// 4. All objects created from object literals are linked to Object.prototype.
// 5. While creating a new object, one can specify the object that should be its prototype. The mechanism that
//    JavaScript provides to do this is messy and complex, but it can be significantly simplified. Example:
//    Let's add a create method to the Object function. The create method creates a new object that uses an
//    old object as its prototype.
if (typeof Object.create !== 'function') {
    Object.create = function(o) {
        var F = function() {
        };
        F.prototype = o;
        return new F();
    };
}

// Let's inherit using the above method
var person = {};
var player = Object.create(person);

// 6. The prototype link has no effect on object modification. When an object is modified, the object's
//    prototype is left touched.
player.first_name = 'Lionel';
player.last_name = 'Messi';
player.nick_name = 'Messi';

console.log("person = ", person); // Remains the same '{}'
console.log("player = ", player); // Contains updated data

// 7. Delegation
//    The prototype link is used ONLY in retrieval. If we try to retrieve a property value from an object,
//    and if the object lacks the property name, then JavaScript attempts to retrieve the property value from
//    the prototype object. And if that object is lacking the property, then it goes to its prototype, and so
//    on until the process finally bottoms out with Object.prototype. If the desired property exists nowhere
//    in the prototype chain, then the result is the undefined value. This is called delegation.

// 8. The prototype relationship is a dynamic relationship. If we add a new property to a prototype, that
//    property will immediately be visible in all of the objects that are based on that prototype.
person.club = 'Barcelona FC';
console.log("player.club = ", player.club); // 'Barcelona FC'