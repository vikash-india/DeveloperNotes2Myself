// Description: For-In Loop construct in JavaScript

// Note
// 1. The for-in form enumerates the property names (or keys) of an object. On each iteration, another property name
//   string from the object is assigned to the variable.

var person = {
    firstname : "Lionel",
    middlename : "Andres",
    lastname : "Messi",
};

var name = "";
for (x in person) {
    if (name.length > 0)
        name = name + " ";

    name = name + person[x];
}

console.log(name);