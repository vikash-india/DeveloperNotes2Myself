package concepts;

/*
 * Description: Methods in Java
 * Note
 * 1. Methods can be public, private or protected.
 * 2. In addition to that a method can also be static or non-static.
 * 3. Check P027_Classes_Methods.java for more about methods.
 */
public class P014_Methods {

    public static void main(String args[]) {

        // Calling Methods
        methodWithNoArguments();
        methodWithArguments(10, 'A');
    }

    // Defining Methods
    public static void methodWithNoArguments() {

        System.out.println("A method with no arguments and return values");
    }

    // Defining Methods
    public static void methodWithArguments(int i, char c) {

        System.out.println("A method with arguments but no return return values");
        System.out.println("Arguments are: " + i + " " + c);
    }
}