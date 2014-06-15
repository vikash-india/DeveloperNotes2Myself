// Description: Global variables in JavaScript

// 1. JavaScript supports defining and using global variables that can hold all the assets of an application.
//    Unfortunately, global variables weaken the resiliency of programs and should be AVOIDED.
// 2. One way to minimize the use of global variables is to create a single global variable for an application.
//    By reducing your global footprint to a single name, you significantly reduce the chance of bad interactions
//    with other applications, widgets or libraries. Program are easier to read because it is obvious that MYAPP.person
//    refers to a top-level structure.
// 3. Another effective global abatement technique is to use closure for information hiding.

// This variable becomes the container of an application
var MYAPP = {};

// Add a person object
MYAPP.person = {
    firstname : "Lionel",
    lastname : "Messi"
};
// Add an array of clubs
MYAPP.clubs = [ 'Barcelona', 'Manchaster United', 'Real Madrid' ];

console.log(MYAPP);
