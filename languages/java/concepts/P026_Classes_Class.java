package concepts;

/*
 * Description: Classes in Java
 * Note
 * 1. The syntax for defining a class is as follows
 *        // Contents of ClassName.java
 *        [public] [(abstract|final)] class ClassName [extends ParentClass] [implements Interfaces] {
 *            // variables and methods & constructors are declared within the curly braces
 *        }
 * 2. A class can have private, public or default (no modifier) visibility.
 * 3. It can be either abstract or final or concrete (no modifier).
 * 4. It must have the class keyword, and class must be followed by a legal identifier.
 * 5. It may optionally extend one parent class. By default, it will extend java.lang.Object.
 * 6. It may optionally implement any number of comma-separated interfaces.
 * 7. The class's variables and methods are declared within a set of curly braces '{}'.
 * 8. Each .java source file may contain only one public class. A source file may contain any number of default visible
 *    classes.
 * 9. Finally, the source file name must match the public class name and it must have a .java suffix.
 */

public class P026_Classes_Class {

    public static void main(String args[]) {

        // To create a new instance class
        P026_Sample sample = new P026_Sample();

        int result = sample.addNumbers(5, 1, 2);
        System.out.println("Result of a 5 + 1 + 2 = " + result);

        result = sample.addNumbers();
        System.out.println("Result of p + q + r = " + result);
        // To display message
        sample.addAndDisplayResult();
    }
}

// Class declaration
class P026_Sample {

    // Member variables (Also called fields / state) declaration
    private int p, q, r;

    // Constructor
    P026_Sample() {
        p = 1;
        q = 2;
        r = 3;
    }

    // Public Methods (Also called behaviour) definition
    public int addNumbers(int var1, int var2, int var3) {
        return var1 + var2 + var3;
    }

    public int addNumbers() {
        return p + q + r;
    }

    public void addAndDisplayResult() {
        System.out.println("addAndDisplayResult = " + addNumbers());
    }

} // End of Class
