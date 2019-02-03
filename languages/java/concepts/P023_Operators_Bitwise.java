package concepts;

/*
 * Description: Bitwise Operators in Java
 * Note
 * 1. Java supplies a primitive data type called boolean, instances of which can take the value true or false only.
 * 2. Boolean data type has the default value false.
 * 3. The major use of Boolean facilities is to evaluate expressions which control if decisions and while loops.
 * 4. The boolean operation works as follows
 *	     A         B             A|B       A&B      A^B      !A
 *	     false     false         false     false    false    true
 *	     true      false         true      false    true     false
 *	     false     true          true      false    true     true
 *	     true      true          true      true     false    false
 */
public class P023_Operators_Bitwise {

    public static void main(String args[]) {

        boolean A = true;
        boolean B = false;
        boolean result = false;

        result = !A;                            // ! the NOT operator
        result = A & B;                         // & the AND operator
        result = A | B;                         // | the OR operator
        result = A ^ B;                         // ^ the XOR operator
        result = (A | B) & A;
        System.out.println(result);

        int rightShift = 8 >> 2;                // Right shift operator
        int leftShift = 8 << 2;                 // Left Shift operator
        int unsignedRightShift = -1 >>> 2;      // Unsigned right shift

        // Print values
        System.out.println(leftShift);
        System.out.println(rightShift);
        System.out.println(unsignedRightShift);
    }
}
