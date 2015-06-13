package concepts;

/*
 * Description: Variable Number of arguments For a Method
 * Note
 * 1. int... test is treated like an array inside the function.
 */

public class P016_Methods_VariableArguments {

    public static void main(String args[]) {

        // Calling a variable argument function
        myFunction(1, 2, 3, 4, 5);
    }

    // Declaring a variable argument list
    public static void myFunction(int... test) {

        System.out.println("Total number of arguments: " + test.length);
        for (int counter = 0; counter < test.length; counter++) {
            System.out.println(test[counter]);
        }
    }
}