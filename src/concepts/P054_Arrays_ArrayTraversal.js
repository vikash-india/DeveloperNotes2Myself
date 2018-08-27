// Description: Array Traversal in JavaScript

// Note
// 1. Since JavaScript arrays are really objects, the for-in statement can be used to iterate over all the
//    properties of an array. Unfortunately, for-in makes no guarantee about the order of the properties.
// 2. Using for-in statement for traversing an array creates a possibility of unexpected properties being
//    dredged up from the prototype chain.

var numbers = [ 'Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine' ];

// Example 1: The for-in loop does not guarantee order
console.log("Traversing using for-in loop:");
for ( var x in numbers) {
    console.log(numbers[x]);
}

// Example 2: The for loop guarantees order. This is preferable.
console.log("Traversing using for loop:");
for ( var i = 0; i < numbers.length; i += 1) {
    console.log(numbers[i]);
}
