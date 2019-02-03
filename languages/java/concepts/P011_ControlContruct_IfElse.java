package concepts;

/*
 * Description: If-Else Control Construct in Java
 * Note
 * 1. One If-Else can be nested within another If-Else statement.
 *
 */
public class P011_ControlContruct_IfElse {

    public static void main(String args[]) {

        int i = 12;

        // Option 1: If loop without else
        if (i == 10) {
            System.out.println("Equal to 10");
        }

        // Option 1: If loop with else
        if (i == 10) {
            System.out.println("Equal to 10");
        } else {
            System.out.println("Not Equal to 10");
        }

        // Option 3: Nested If-Else
        if (i == 10) {
            System.out.println("Equal to 10");
        } else if (i == 11) {
            System.out.println("Equal to 11");
        } else if (i == 12) {
            System.out.println("Equal to 12");
        } else if (i == 13) {
            System.out.println("Equal to 13");
        } else {
            System.out.println("Not in range");
        }
    }
}