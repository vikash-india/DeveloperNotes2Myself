package concepts;

/*
 * Description: Command Line Arguments in Java
 * Note
 * 1. Arguments are passed as a String array to the main method of a class.
 * 2. The first element (0th element) is the first argument passed and NOT the name of the class.
 */
public class P019_Methods_CommandLineArguments {

    // The argument name can be anything and need not necessarily be args[]
    public static void main(String args[]) {

        System.out.println("Command Line Arguments");
        for (int i = 0; i < args.length; ++i) {
            System.out.println(args[i]);
        }
    }
}