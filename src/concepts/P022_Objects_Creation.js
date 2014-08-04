// Description: Objects creation in JavaScript

// Objects Creation
// 1. A property name can be any string, including an empty string.
// 2. The quotes around a property's name in an object literal are optional if the name is a legal JavaScript name and
//    not a reserved word.
// 3. Commas are used to separate the name-value pairs.
// 4. Objects can be nested.
// 5. There are 3 ways to create an object

// Creating an empty object
var empty_object = {};

// Creating a nested object
var person = {
    firstname : "Lionel", // Quotes around firstname are optional.
    "middle-name" : "Andres", // Quotes around "middle-name" are required.
    last_name : "Messi", // // Quotes around last_name are optional.
    address : {
        email : 'messi@leomessi.com', // Even single quotes can be used.
        phone : 1234567890
    }
};

// Alternate way of creating an object
var address = new Object();
address.email = "messi@leomessi.com";
address.phone = 1234567890;

console.log("address.phone", address.phone);