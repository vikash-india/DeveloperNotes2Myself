// Description: Object Retrieval in JavaScript

// An Object
var person = {
    first_name : "Lionel",
    "middle-name" : "Andres",
    last_name : "Messi",
    address : {
        email : 'messi@leomessi.com', // Even single quotes can be used.
        phone : 1234567890
    }
};

// Object Retrieval
// 1. Suffix([ ]) Notation: Values can be retrieved from an object by wrapping a string expression in a [ ]
//    suffix.
var middleName = person["middle-name"]; // "Andres"

// 2. Dot(.) notation: If the string expression is a constant, and if it is a legal JavaScript name & not a
//    reserved word, then the dot (.) notation can be used. The dot (.) notation is preferred because it is
//    more compact and it reads better.
var email = person.address.email; // 'messi@leomessi.com'

// 3. The undefined value is produced if an attempt is made to retrieve a nonexistent member.
var fatherName = person.fathername; // undefined
var firstName = person["FIRST-NAME"]; // undefined. Case-sensitive

// 4. The default operator (||) can be used to fill in default values
var middlename = person["middle-name"] || "unknown";

// 5. Attempt to retrieve values from undefined will throw a TypeError exception.
var job = person.job; // undefined
var organization = person.job.organization; // Throw "TypeError" since person.job is undefined

// 6. TypeError exception can be guarded against using the guard operator (&&).
var organization = person.job && person.job.organization; // undefined

console.log(organization);