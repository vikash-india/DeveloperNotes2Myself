package concepts;

/*
 * Description: Multilevel Inheritance in Java
 * Note
 *  1. The answer is that in a class hierarchy, constructors are called in order of derivation, from superclass to
 *     subclass.
 */
public class P059_Inheritance_MultiLevelInheritance {

    public static void main(String args[]) {
        P059_C c = new P059_C();
        c.toString();
    }
}

// Demonstrate when constructors are called.

// Create a super class.
class P059_A {
    P059_A() {
        System.out.println("Inside A's constructor.");
    }
}

// Create a subclass by extending class A.
class P059_B extends P059_A {
    P059_B() {
        System.out.println("Inside B's constructor.");
    }
}

// Create another subclass by extending B.
class P059_C extends P059_B {
    P059_C() {
        System.out.println("Inside C's constructor.");
    }
}