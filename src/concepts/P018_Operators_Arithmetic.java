package concepts;

/*
 * Description: Arithmetic Operators in Java
 */

public class P018_Operators_Arithmetic {

    public static void main(String args[]) {

        int operand1 = 41;
        int operand2 = 2;
        int result = 0;

        // Various Unary Operators
        result = +operand1;                     // Unary Addition
        result = -operand1;                     // Unary Subtraction

        // Various Binary Operators
        result = operand1 + operand2;           // + for addition.
        result = operand1 - operand2;           // - for subtraction.
        result = operand1 * operand2;           // * for multiplication.
        result = operand1 / operand2;           // / for division.
        result = operand1 % operand2;           // % for modulo division or remainder.

        // TODO: Arithmetic Operators on Floating Point and understand the details.
        System.out.println(result);
    }
}