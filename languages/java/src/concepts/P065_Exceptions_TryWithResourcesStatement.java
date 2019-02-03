package concepts;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/*
 * Description: Exception Handling - Try with Resources Statement
 * Note
 * 1. This feature is available from Java 1.7 onwards.
 * 2. The try-with-resources statement is a try statement that declares one or more resources. A resource is an object
 *    that must be closed after the program is finished with it. The try-with-resources statement ensures that each
 *    resource is closed at the end of the statement. Any object that implements java.lang.AutoCloseable, which
 *    includes all objects which implement java.io.Closeable, can be used as a resource.
 */
public class P065_Exceptions_TryWithResourcesStatement {

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

    // JDK 1.6 way of closing resources even if any exception happens
    static String readFirstLineFromFileWithFinallyBlock(String path) throws IOException {
        BufferedReader br = new BufferedReader(new FileReader(path));
        try {
            return br.readLine();
        } finally {
            if (br != null)
                br.close();
        }
    }

    // JDK 1.7 way of doing the above thing
    // static String readFirstLineFromFile(String path) throws IOException {
    //     try (BufferedReader br = new BufferedReader(new FileReader(path))) {
    //         return br.readLine();
    //     }
    // }
}