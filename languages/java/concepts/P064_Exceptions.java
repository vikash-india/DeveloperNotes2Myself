package concepts;

/*
 * Description: Exception Handling
 * Note
 * 1. An exception is an event, which occurs during the execution of a program, that disrupts the normal flow of the
 *    program's instructions.
 * 2. When an error occurs within a method, the method creates an object and hands it off to the runtime system. The
 *    object, called an exception object, contains information about the error, including its type and the state of the
 *    program when the error occurred. Creating an exception object and handing it to the runtime system is called
 *    throwing an exception.
 * 3. The runtime system searches the call stack in the reverse order for a method that contains a block of code that
 *    can handle the exception. This block of code is called an exception handler.
 * 4. The exception handler chosen is said to catch the exception. If the runtime system exhaustively searches all the
 *    methods on the call stack without finding an appropriate exception handler, the runtime system (and, consequently,
 *    the program) terminates.
 * 5. The syntax of exception handling is as follows
 *              try {
 *		    // Section of code which might fail
 *		} catch (ExceptionType1 e1) {
 *                  // Program control comes here if exception happens in try block
 *
 *                  // Note: ExceptionType1, declares the type of exception that the handler can handle and must be the
 *                  //       name of a class that inherits from the Throwable class.
 *                  // Note: In Java SE 7 and later, a single catch block can handle more than one type of exception.
 *                  //       This feature can reduce code duplication and lessen the temptation to catch an overly broad
 *                  //       exception. Eg catch (IOException|SQLException ex) {...}
 *
 *		} catch (ExceptionType2 e2) {
 *		    // Program control comes here if exception is not handled by e1 block
 *
 *		} finally {
 *		    // The finally block always executes when the try block exits.
 *
 *                  // Note: But finally is useful for more than just exception handling it allows the programmer to
 *                  // avoid having cleanup code accidentally bypassed by a return, continue, or break. Putting cleanup
 *                  // code in a finally block is always a good practice, even when no exceptions are anticipated.
 *
 *                  // Note: The finally block is a key tool for preventing resource leaks.
 *                  // When closing a file or otherwise recovering resources, place the code
 *                  // in a finally block to ensure that resource is always recovered.
 *              }
 * 6. Uses of Exception Handling
 *      - React to an error in a custom defined way. E.g. A read error does not mean that the program should crash.
 *	- Write code with no worry about failure which will be handled by the users of your class.
 *	     - Group error handling code much better.
 *	     - Make application more transactional focused with nested try catch blocks.
 * 7. The runtime environment is responsible for moving from the regular program flow to the exception handlers when an
 *    exceptional condition arises.
 */

public class P064_Exceptions {

    public static void main(String args[]) {

        int y = 0;
        int x = 1;
        try {
            // A division by 0 occurs here.
            int z = x / y;
            System.out.println("This wont get executed if exception happens in previous line");
        } // No code can be between the end of the try block and the beginning of the first catch block
        catch (ArithmeticException ae) {

            System.out.println("Attempt to divide by 0");
            // Way to print the error
            System.out.println("Error: " + ae);
        } finally {
            System.out.println("In Finally Block");
        }

        System.out.println("Execution resumes after catch");
    }
}