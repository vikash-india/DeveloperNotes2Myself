// Description: Objects reference in JavaScript

// Object Reference:
// 1. Objects are passed around by reference.

// Example 1:
var player = {
    first_name : "Cristiano",
    last_name : "Ronaldo",
};
var x = player;
x.nickname = 'Ronaldo';
var nick = player.nickname; // nick is 'Ronaldo' because x and player are references to the same object

// Example 2: The objects a, b, and c each refer to a different empty object
var a = {}, b = {}, c = {};

// Example 3: The objects a, b, and c all refer to the same empty object
a = b = c = {};
