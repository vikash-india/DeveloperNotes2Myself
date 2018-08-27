// Description: Built-in Array Methods in JavaScript

// Method array.concat(item...)
// 1. The concat method produces a new array containing a shallow copy of this array with the items appended to it.
// 2. If an item is an array, then each of its elements is appended individually.
var a = [ 'a', 'b', 'c' ];
var b = [ 'x', 'y', 'z' ];
var c = a.concat(b, true);

console.log("Method concat\t\t: " + c); // c is ['a', 'b', 'c', 'x', 'y', 'z', true]

// Method array.join(separator)
// 1. The join method makes a string from an array by making a string of each of the array’s elements,
//    and then concatenating them all together with a separator between them.
// 2. The default separator is ','.
// 3. To join without separation, use an empty string as the separator.
// 4. It is usually faster to put the pieces into an array and join them than it is to concatenate the pieces with
//    the + operator.
var a = [ 'a', 'b', 'c' ];
a.push('d');
var c = a.join('');

console.log("Method join\t\t: " + c); // c is 'abcd';

// Method array.pop( )
// 1. The pop and push methods make an array work like a stack.
// 2. The pop method removes and returns the last element in this array.
// 3. If the array is empty, it returns undefined.
var a = [ 'a', 'b', 'c' ];
var c = a.pop();

console.log("Method pop (Array)\t: " + a); // a is ['a', 'b']
console.log("Method pop (Element)\t: " + c); // c is 'c'

// Method array.push(item...)
// 1. The pop and push methods make an array work like a stack.
// 2. The push method appends items to the end of an array.
// 3. Unlike the concat method, it modifies the array and appends array items whole.
// 4. It returns the new length of the array.
var a = [ 'a', 'b', 'c' ];
var b = [ 'x', 'y', 'z' ];
var c = a.push(b, true);

console.log("Method push (Array)\t: " + a); // a is ['a', 'b', 'c', ['x', 'y', 'z'], true]
console.log("Method push (Element)\t: " + a[3]); // a[3] is ['x', 'y', 'z']
console.log("Method push (Returns)\t: " + c); // c is 5;

// Method array.reverse()
// 1. The reverse method modifies the array by reversing the order of the elements.
// 2. It returns the modified array.
var a = [ 'a', 'b', 'c' ];
var b = a.reverse();

console.log("Method reverse (a)\t: " + a); // both a and b are ['c', 'b', 'a']
console.log("Method reverse (b)\t: " + b); // both a and b are ['c', 'b', 'a']

// Method array.shift()
// 1. The shift method removes the first element from an array and returns it.
// 2. If the array is empty, it returns undefined.
// 3. The shift method is usually much slower than pop.
var a = [ 'a', 'b', 'c' ];
var c = a.shift();

console.log("Method shift (a)\t: " + a); // a is ['b', 'c']
console.log("Method shift (c)\t: " + c); // c is 'a'

// Method array.slice(start, end)
// 1. The slice method makes a shallow copy of a portion of an array.
// 2. The first element copied will be array[start]. It will stop before copying array[end].
// 3. The end parameter is optional, and the default is array.length.
// 4. If either parameter is negative, array.length will be added to them in an attempt to make them nonnegative.
// 5. If start is greater than or equal to array.length, the result will be a new empty array.
// 6. The slice method is different from array.splice method or string.slice method.
var a = [ 'a', 'b', 'c' ];
var b = a.slice(0, 1);
var c = a.slice(1);
var d = a.slice(1, 2);

console.log("Method slice (a)\t: " + a); // a is [ 'a', 'b', 'c' ]
console.log("Method slice (b)\t: " + b); // b is ['a']
console.log("Method slice (c)\t: " + c); // c is ['b', 'c']
console.log("Method slice (d)\t: " + d); // d is ['b']

// Method array.splice(start, deleteCount, item...)
// 1. The splice method removes elements from an array, replacing them with new items.
// 2. The start parameter is the number of a position within the array.
// 3. The deleteCount parameter is the number of elements to delete starting from that position.
// 4. If there are additional parameters, those items will be inserted at the position.
// 5. It returns an array containing the deleted elements.
// 6. The most popular use of splice is to delete elements from an array.
var a = [ 'a', 'b', 'c' ];
var r = a.splice(1, 1, 'ache', 'bug');

console.log("Method splice (a)\t: " + a); // a is ['a', 'ache', 'bug', 'c']
console.log("Method splice (r)\t: " + r); // r is ['b']

// Method array.unshift(item...)
// 1. The unshift method is like the push method except that it shoves the items onto the front of this array instead
//    of at the end.
// 2. It returns the array’s new length.
var a = [ 'a', 'b', 'c' ];
var r = a.unshift('?', '@');

console.log("Method unshift (a)\t: " + a); // a is ['?', '@', 'a', 'b', 'c']
console.log("Method unshift (r)\t: " + r); // r is 5

// Method array.sort(comparefunction)
// 1. The sort method sorts the contents of an array in place.
// 2. It sorts arrays of numbers incorrectly since it does string/ASCII sorting.
// 3. The correct sorting can be achieved by writing custom comparison functions.
var n = [ 4, 8, 15, 16, 23, 42 ];
n.sort();

console.log("Method sort (n)\t\t: " + n); // n is [15, 16, 23, 4, 42, 8]
