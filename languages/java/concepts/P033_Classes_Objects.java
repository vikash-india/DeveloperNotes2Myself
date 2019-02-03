package concepts;

/*
 * Description: Objects in Java
 * Note
 * 1. Objects are instances of a class.
 * 2. Just like variables, objects needs to be declared, defined and initialised.
 */

public class P033_Classes_Objects {

    public static void main(String args[]) {

        // 1. Declaration
        P029_Sample sample1 = null;

        // 2. Instantiation (Creating an object) using the new keyword
        // 3. Instantiation is automatically followed by a call to its constructor.
        sample1 = new P029_Sample();

        // 4. Use object by calling its methods
        sample1.addAndDisplayResult();

        // 1 - 3: Declaration, Instantiation and Initialisation in a single step
        P029_Sample sample2 = new P029_Sample();

        // 4. Use object by calling its methods
        int result = sample2.addNumbers(5, 1, 2);
        System.out.println("The result is " + result);

        sample2.addAndDisplayResult();

        // Sample3 points to the same object Sample2
        P029_Sample sample3 = sample2;
        result = sample3.addNumbers(5, 1, 2);
        System.out.println("The result is " + result);
    }
}

// Class
class P029_Sample {

    // Member variables
    private int p, q, r;

    // Constructor
    P029_Sample() {
        p = 1;
        q = 2;
        r = 3;
    }

    // Public Methods
    public int addNumbers(int var1, int var2, int var3) {
        return var1 + var2 + var3;
    }

    public int addNumbers() {
        return p + q + r;
    }

    public void addAndDisplayResult() {
        System.out.println("Result: " + addNumbers());
    }
}