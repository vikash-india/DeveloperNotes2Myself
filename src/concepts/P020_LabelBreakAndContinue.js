// Description: Label, Break & Continue in JavaScript

// Labels
// 1. To label JavaScript statements the statements should be preceded with a colon (LABEL_NAME:)
// 2. The break & the continue statements are the only JavaScript statements that can "jump out of" a
//    code block to a particular label

// Break
// 1. The break statement breaks the loop and continues executing the code after the loop (if any).
// 2. The break statement, without a label reference, can only be used inside a loop or a switch.
// 3. It can optionally have a label that will cause an exit from the 'label' statement.
// 4. JavaScript does not allow a line end between the break and the label.

// Continue
// 1. The continue statement breaks one iteration (in the loop), if a specified condition occurs,
//    and continues with the next iteration in the loop.
// 2. The continue statement (with or without a label reference) can only be used inside a loop.

LOOP_I: for ( var i = 0; i < 5; i++) {
    LOOP_J: for ( var j = 0; j < 5; j++) {
        console.log("i = " + i + ", j = " + j);
        if (j == 3) {
            break LOOP_I; // Try with LOOP_I and LOOP_J
        }
    }
    console.log("After Label LOOP_J, i = ", i);
}

console.log("After Label LOOP_I & LOOP_J");
