package concepts;

/*
 * Description: Assignment Operators in Java
 * Note
 * 1. The assignment operator is evaluated from right to left, so a = b = c = 0; would assign 0 to c, then c to b
 *    then b to a.
 * 2. Assignment operator can be used for all 5 arithmetic operators ( +  -  *  /  % ).
 */
public class P027_Operators_Assignment {

    public static void main(String args[]) {

        // Assignment operator
        int i = 2;
        boolean result = false;
        int shiftResult = 1;

        // Arithmetic Assignment
        i += 1;                         // Assigning the result of 2 + 1 to i
        i -= 1;
        i *= 1;
        i /= 1;
        i %= 1;

        // Bitwise Assignment Operators
        result |= true;
        result &= true;
        result ^= true;
        System.out.println(result);

        // Logical Assignment Operators
        // Nothing

        // Shift Assignment Operators
        shiftResult >>= 2;
        shiftResult <<= 2;

        System.out.println(i);
        System.out.println(shiftResult);
    }
}