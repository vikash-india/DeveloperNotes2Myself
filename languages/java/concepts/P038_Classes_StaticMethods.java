package concepts;

/*
 * Description: Static Methods in Java
 * Note
 * 1. Static methods, which have the static modifier in their declarations, should be invoked with the class name,
 *    without the need for creating an instance of the class.
 * 2. A common use for static methods is to access static fields.
 * 3. Methods declared as static have several restrictions
 *	- They can only call other static methods.
 *	- They must only access static data.
 *	- They cannot refer to this or super in any way. (The keyword super relates to inheritance and is described
 *        in subsequent examples.)
 */
public class P038_Classes_StaticMethods {

    static int a = 3;

    static void staticMethod(int x) {
        System.out.println("x = " + x);
        System.out.println("a = " + a);
    }

    public static void main(String args[]) {
        staticMethod(42);
    }
}