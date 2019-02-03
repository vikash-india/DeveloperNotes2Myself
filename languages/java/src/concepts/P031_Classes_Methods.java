package concepts;

/*
 * Description: Methods
 * Note
 * 1.  Member variables in a class are called fields.
 * 2.  Variables in a method or block of code are called local variables.
 * 3.  Variables in method declarations are called parameters.
 * 4.  Methods can be public, private or protected.
 * 5.  In addition to that a method can also be static or non-static.
 * 6.  A public method can be called from anywhere.
 * 7.  A private method can only be used within the class where it is defined.
 * 8.  A protected method can be used anywhere within the package in which it is defined.
 * 9.  Methods that aren't specifically declared public or private are protected by default.
 * 10. Static methods have only one instance per class rather than one instance per object.
 * 11. By default methods are not static.
 * 12. The first (or only) word in a method name should be a verb.
 * 13. Primitive arguments, such as an int or a double, are passed into methods by value.
 * 14. Reference data type parameters, such as objects, are also passed into methods by references.
 * 15. You also can use interface names as return types. In this case, the object returned must implement
 *     the specified interface.
 */
public class P031_Classes_Methods {

    public static void main(String args[]) {

        // Calling Methods
        methodWithNoArguments();
        methodWithArguments(10, 'A');
        factorial(45);
    }

    public static void methodWithNoArguments() {
        System.out.println("A method with no arguments and return values");
    }

    // Defining Methods
    public static void methodWithArguments(int i, char c) {
        System.out.println("A method with arguments but no return return values");
        System.out.println("Arguments are: " + i + " " + c);
    }

    // Defining Methods: Factorial of a number
    public static long factorial(int n) {
        System.out.println("A method with arguments and return return values");
        System.out.println("This computes the factorial of the number: " + n);

        int i;
        long result = 1;
        for (i = 1; i <= n; i++) {
            result *= i;
        }
        System.out.println("Returning Value: " + result);
        return result;
    }
}