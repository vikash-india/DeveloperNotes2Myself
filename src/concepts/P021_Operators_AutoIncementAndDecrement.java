package concepts;

/*
 * Description: Increment and Decrement Operators in Java
 */

public class P021_Operators_AutoIncementAndDecrement {

    public static void main(String args[]) {

        int i = 3;
        int result = 0;

        result = ++i;                   // Pre-increment operator.
        result = i++;                   // Post-increment operator.

        result = --i;                   // Pre-decrement operator.
        result = i--;                   // Post-decrement operator.

        System.out.println(result);
    }
}