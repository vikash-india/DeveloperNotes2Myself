package concepts;

/*
 * Description: Public, Private, Protected and default Access Specifiers
 * Note
 * 1. Access Levels
 *          Modifier       Class   Package   Subclass   World
 *          public           Y        Y          Y        Y
 *          protected        Y        Y          Y        N
 *          no modifier      Y        Y          N        N
 *          private          Y        N          N        N
 * 2. Visibility Levels: Let Alpha and Beta be in package 1 and Alphasub and Gamma be in package 2.
 *    Additionally, let Alphasub inherit from Alpha.
 *          Modifier        Alpha   Beta     Alphasub   Gamma
 *          public            Y       Y          Y        Y
 *          protected         Y       Y          Y        N
 *          no modifier       Y       Y          N        N
 *          private           Y       N          N        N
 * 3. Protected is used only for inheritance.
 * 4. Default method is public.
 */

public class P031_Classes_AccessModifiers {

    public static void main(String args[]) {

        P031_Sample sample = new P031_Sample();

        // Accessing public members directly
        sample.a = 10;
        sample.b = 20;
        // sample.c = 100; // Error! since c is not public

        // Accessing private members using its methods
        sample.setc(100);

        System.out.println("a, b, and c: " + sample.a + " " + sample.b + " " + sample.getc());
    }
}

class P031_Sample {
    int a;              // default access
    public int b;       // public access
    private int c;      // private access

    // methods to access c
    void setc(int i) {
        c = i;          // set c's value
    }

    int getc() {
        return c;       // get c's value
    }
}