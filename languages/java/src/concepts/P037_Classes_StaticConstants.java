package concepts;

import static concepts.P037_Constants.PI;
import static concepts.P037_Constants.TAU;

/*
 * Description: Constants in Java
 * Note
 * 1. The static modifier, along with final modifier, is also used to define constants.
 * 2. The final modifier indicates that the value of this field cannot change.
 * 3. Constants defined in this way cannot be reassigned.
 * 4. By convention, the names of constant values are spelled in uppercase letters. If the name is composed of more
 *    than one word, the words are separated by an underscore (_).
 */
public class P037_Classes_StaticConstants {

    public static void main(String args[]) {
        System.out.println("PI (" + PI + ") is wrong. Start simplifying things using TAU (" + TAU + ")");
    }
}

class P037_Constants {

    // Mathematical constants
    public static final double PI = 3.141592653;
    public static final double TAU = 6.283185307;
}