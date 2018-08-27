// Description: Array Length in JavaScript

// Note
// 1. Every array has a length property.
// 2. Unlike most other languages, JavaScript’s array length is not an upper bound. It can be modified.
// 3. The length property is the largest integer property name in the array plus one. This is not necessarily the
//    number of properties in the array.
// 4. The length can be set explicitly. Making the length larger does not allocate more space for the array. Making
//    the length smaller will cause all properties with a subscript that is greater than or equal to the new length
//    to be deleted.
// 5. A new element can be appended to the end of an array by assigning to the array’s current length.

// Example 1
var numbers = [];

console.log("Length: " + numbers.length); // 0

// Example 2: Length does not specify the number of elements in the array.
numbers[1000] = true;

console.log("Length: " + numbers.length); // 1001. But numbers contains only one property. Rest are undefined.

// Example 3: The length property can be modified
var numbers = [ 'Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine' ];

console.log("Elements: " + numbers);

numbers.length = 3;

console.log("Elements when length is set to 3: " + numbers); // numbers is ['zero', 'one', 'two']

numbers.length = 5;

console.log("Elements when length is set to 5: " + numbers); // Increasing the length property does not allocate space.

// Example 4: Appending an element at the end of an array.
var numbers = [ 'Zero', 'One', 'Two' ];
numbers[numbers.length] = 'Three';

console.log("Elements: " + numbers); // The numbers is ['Zero', 'One', 'Two', 'Three']

// Example 5: It is sometimes more convenient to use the push method instead of using the length propery.
numbers.push('Four');

console.log("Elements: " + numbers); // The numbers is ['Zero', 'One', 'Two', 'Three', 'Four']
