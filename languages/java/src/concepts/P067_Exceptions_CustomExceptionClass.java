package concepts;

/*
 * Description: Exception Handling - Custom Exception Class
 * Note
 * 1. One can define his/her own Exception Class to be thrown during application error.
 * 2. For readable code, it's good practice to append the string Exception to the names of all classes that inherit
 *    (directly or indirectly) from the Exception class.
 */
public class P067_Exceptions_CustomExceptionClass {

    public static void main(String args[]) {

        try {
            divide(1, 0);
        } catch (P263_MyException ae) {
            System.out.println("main: ArithmeticException caught and handled in the calling function");
        }
    }

    // Declare all the exception that can be thrown by a method
    public static void divide(int x, int y) throws P263_MyException {
        try {
            // A division by 0 occurs here.
            int z = x / y;
            System.out.println("z = " + z);
        } catch (ArithmeticException ae) {
            System.out.println("divide: P263_MyException is thrown from the method.");
            throw new P263_MyException("Divide By Zero");
        } finally {
            System.out.println("divide: In Finally Block");
        }
    }
}

class P263_MyException extends Exception {
    private String errorCode = "-1";

    public P263_MyException(String msg) {
        super(msg);
        System.out.println("P263_MyException: " + msg);
    }

    public P263_MyException(String msg, String errorCode) {
        super(msg);
        this.errorCode = errorCode;
    }

    public P263_MyException(String msg, Exception e) {
        super(msg, e);
        System.out.println("P263_MyException:" + msg + e);
    }
}