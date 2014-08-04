// Description: Objects modifications in JavaScript

// An object
var person = {
    first_name : "Lionel",
    middle_name : "Andres",
    last_name : "Messi",
};

// Modifying Objects
// 1. If the property name already exists in the object, the property value is replaced.
person.middle_name = "A";

// 2. Alternate way of accessing the object index
person["middle_name"] = "A";

// 3. If the object does not already have that property name, the object is augmented.
person.club = "Barcelona FC";

console.log(person["middle_name"]);
console.log(person.club);
