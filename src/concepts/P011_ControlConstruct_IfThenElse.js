// Description: If...Else If...Else Construct in JavaScript

// Note
// 1. There can be 0, 1 or more else-if blocks.
// 2. The else part is optional and is executed when none of the condition matches.
var rainfall = 100;
var message = undefined;

if (rainfall == 0) {
    message = "No Rainfall!";
} else if (rainfall < 20) {
    message = "Light Rainfall!";
} else if (rainfall < 50) {
    message = "Medium Rainfall!";
} else {
    message = "Heavy Rainfall!";
}

console.log(message);