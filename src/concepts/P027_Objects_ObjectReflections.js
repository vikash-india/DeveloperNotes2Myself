// Description: Object reflections using typeof operator in JavaScript

// Note
// 1. Any object can be inspected for the properties it has by attempting to retrieve the properties and examining
//    the values obtained. The typeof operator is used for checking the type of a property.
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

// 2. The typeof person.age is same as typeof(person.age)
console.log(typeof person.age); // 'number'
console.log(typeof person.firstname); // 'string'
console.log(typeof person.address); // 'object'
console.log(typeof person.club); // 'undefined'

// 3. Care must be taken because any property on the prototype chain can produce a value
console.log(typeof person.toString); // 'function'
console.log(typeof person.constructor); // 'function'

// 4. There are two approaches to dealing with these undesired properties that shows up due to prototype linkage. One
//    approach is to have your program look for and reject function values. Generally, when you are reflecting, you
//    are interested in data, and so you should be aware that some values could be functions.
// 5. The second approach is to use the hasOwnProperty method, which returns true if the object has a particular
//    property. The hasOwnProperty method does not look at the prototype chain.
console.log(person.hasOwnProperty('age')); // true
console.log(person.hasOwnProperty('club')); // false
console.log(person.hasOwnProperty('constructor')); // false
