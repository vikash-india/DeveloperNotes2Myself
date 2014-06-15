// Description: Delete operator in JavaScript

// 1. The delete operator can be used to remove a property from an object if the property exists in the object.
// 2. The delete operator will not touch any of the objects in the prototype linkage.
var person = {
    firstname : "Lionel",
    middlename : "Andres",
    lastname : "Messi",
    age : 26,
    address : {
        email : 'messi@leomessi.com',
        phone : 1234567890
    }
};
console.log('Age before deleting: ', person.age);
delete (person.age); // Same as delete(person.age);
console.log('Age after deleting: ', person.age);

// 4. Removing a property from an object may allow a property from the prototype linkage to shine through.
if (typeof Object.create !== 'function') {
    Object.create = function(o) {
        var F = function() {
        };
        F.prototype = o;
        return new F();
    };
}

// Let's inherit using the above method and modify middlename
var player = Object.create(person);
player.middlename = "A";
console.log("\nMiddle name before deleting:", player.middlename); // 'A'

// Remove middlename from person, revealing the middlename of the prototype.
delete player.middlename;
console.log("Middle name AFTER deleting:", player.middlename); // 'Andres'
