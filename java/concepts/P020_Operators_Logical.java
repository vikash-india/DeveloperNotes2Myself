package concepts;

/*
 * Description: Logical Operators in Java
 * Note
 * 1. These operators exhibit "short-circuiting" behaviour, which means that the second operand is evaluated only if
 *    needed.
 */
public class P020_Operators_Logical {

    public static void main(String args[]) {

        int value1 = 1;
        int value2 = 2;

        // Short-Circuit AND
        if ((value1 == 1) && (value2 == 2)) {
            System.out.println("value1 is 1 AND value2 is 2");
        }

        // Short-Circuit OR
        if ((value1 == 1) || (value2 == 1)) {
            System.out.println("value1 is 1 OR value2 is 1");
        }
    }
}