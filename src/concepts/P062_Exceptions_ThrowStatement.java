package concepts;

/*
 * Description: Exception Handling - Throw an Exception
 * Note
 * 1. Sometime instead of handling all exceptions, it makes more sense to throw those exception to be handled by other
 *    stack methods. In such cases, add a throws clause to the method declaration.
 * 2. Two keywords throw and throws are used to for throwing an exception.
 */
public class P074_Exceptions_ThrowStatement {

    public static void main(String args[]) {

        try {
            divide(1, 0);
        } catch (ArithmeticException ae) {
            System.out.println("main: ArithmeticException caught and handled in the calling function");
        }
    }

    // Declare all the exception that can be thrown by a method
    public static void divide(int x, int y) throws ArithmeticException {
        try {
            // A division by 0 occurs here.
            int z = x / y;
            System.out.println("z = " + z);
        } catch (ArithmeticException ae) {
            System.out.println("divide: ArithmeticException is thrown from the method.");
            // 1. Keyword throw is to throw an exception.
            // 2. Throwable objects are instances of any subclass of the Throwable class.
            throw ae;
        } finally {
            System.out.println("divide: In Finally Block");
        }
    }
}