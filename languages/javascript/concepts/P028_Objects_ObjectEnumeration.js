// Description: Object Enumeration in JavaScript

// An Object
var person = {
    firstname   : "Lionel",
    middlename  : "Andres",
    lastname    : "Messi",
    age         : 26,
    address     : {
                    email : 'messi@leomessi.com',
                    phone : 1234567890
    }
};

// 1. The for-in statement can loop over all the property names in an object. The enumeration will include all
//    the properties INCLUDING functions and prototype properties. So it might be necessary to filter out the
//    values you don't want using common filters like hasOwnProperty method and using typeof operator.
console.log("Using For-In loop for enumeration: ");
var key;
for (key in person) {
    if (typeof person[key] !== 'function') {
        console.log(key, "=>", person[key]);
    }
}

// 2. The order of names within an object is NOT guaranteed and it can appear in any order. A way to solve
//    this issue is to avoid the for-in statement entirely and instead make an array containing the names of
//    the properties in the correct order
console.log("\nUsing an array of properties: ");
var properties = [ 'firstname', 'middlename', 'lastname', 'age' ];
for ( var i = 0; i < properties.length; i++) {
    console.log(properties[i] + ': ' + person[properties[i]]);
}
