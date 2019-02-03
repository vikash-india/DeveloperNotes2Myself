package concepts;

/*
 * Description: Ternary Operators in Java
 * Note
 * 1. Ternary Operators are also called Conditional Operators.
 * 2. Its general form is Boolean-expression ? expression-1 when true : expression-2 when false.
 * 3. The JVM tests the value of Boolean-expression. If the value is true, it evaluates expression-1 otherwise, it
 *    evaluates expression-2.
 */
public class P028_Operators_Ternary {

    public static void main(String args[]) {

        int i = 1;
        int j = 2;

        int max = (i > j) ? i : j;

        System.out.println(max);
    }
}