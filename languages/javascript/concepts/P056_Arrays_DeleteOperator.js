// Description: Delete Operator for Arrays in JavaScript

// Note
// 1. Since JavaScript’s arrays are really objects, the delete operator can be used to remove elements from an array.
// 2. Unfortunately, the delete operator leaves a hole in the array. This is because the elements to the right of the
//    deleted element retain their original names.
// 3. The splice method deletes elements and replaces them with other elements. Hence no holes are left in the array.
// 4. The splice method takes two parameters. The first argument is an ordinal in the array. The second argument is
//    the number of elements to delete.

var numbers = [ 'Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine' ];

console.log("Elements: " + numbers);

delete numbers[2];

console.log("Elements: " + numbers); // Leaves a hole in the array

numbers.splice(2, 1); // Arguments are Position, Number of Elements

console.log("Elements: " + numbers); // Does NOT leave holes in the array. But this will be slow for large arrays.
