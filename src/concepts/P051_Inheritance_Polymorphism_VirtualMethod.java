package concepts;

/*
 * Description: Polymorphism in Java
 * Note
 * 1. Dynamic method dispatch is the mechanism by which a call to an overridden method is resolved at run time, rather
 *    than compile time. Dynamic method dispatch is important because this is how Java implements run-time polymorphism.
 * 2. Polymorphism is also called Dynamic Method Dispatch / Virtual Method Invocation.
 */
public class P051_Inheritance_Polymorphism_VirtualMethod {

    public static void main(String args[]) {

        P051_A a = new P051_A();
        P051_B b = new P051_B();
        P051_C c = new P051_C();

        // A reference of type A
        P051_A referenceOfA;

        // Since referenceA points to an A object A's version of callme is called
        referenceOfA = a;
        referenceOfA.callme();

        // Since referenceA points to an B object B's version of callme is called
        referenceOfA = b;
        referenceOfA.callme();

        // Since referenceA points to an C object C's version of callme is called
        referenceOfA = c;
        referenceOfA.callme();
    }
}

class P051_A {
    void callme() {
        System.out.println("Inside A's callme method");
    }
}

class P051_B extends P051_A {
    // Override callme()
    void callme() {
        System.out.println("Inside B's callme method");
    }
}

class P051_C extends P051_A {
    // Override callme()
    void callme() {
        System.out.println("Inside C's callme method");
    }
}