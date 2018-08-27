package concepts;

/*
 * Description: The super Keyword in Java
 * Note
 * 1. A subclass can call a constructor method defined by its superclass using super keyword as follows
 *              super(parameter-list);
 * 2. The second form of super is used to access hidden fields like below
 *	        super.field
 *              super.method(...)
 * 3. If a constructor does not explicitly invoke a superclass constructor, the Java compiler automatically inserts a
 *    call to the no-argument constructor of the superclass. If the super class does not have a no-argument constructor,
 *    you will get a compile-time error. Object does have such a constructor, so if Object is the only superclass,
 *    there is no problem.
 */
public class P053_Inheritance_KeywordSuper {

    public static void main(String args[]) {

        P053_B subObject = new P053_B(1, 2);
        subObject.show();
    }
}

// Using super to overcome name hiding.
class P053_A {
    int i;

    public P053_A(int i) {
        this.i = i;
    }

    public void show() {
        System.out.println("Parent: i = " + i);
    }
}

// Create a subclass by extending class A.
class P053_B extends P053_A {
    // this i hides the i in A
    int i;

    public P053_B(int a, int b) {
        // First Form of Super
        super(a);

        // Field i in A.
        super.i = a;

        i = b; // i in B

        // Method Show in A
        super.show();
    }

    public void show() {
        System.out.println("Child: i in superclass: " + super.i);
        System.out.println("Child: i in subclass: " + i);
    }
}