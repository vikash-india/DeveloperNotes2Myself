package concepts;

/*
 * Description: Nested Classes - Static Nested Classes and Inner Classes in Java
 * Note
 * 1. Classes defined within another class are called nested classes.
 * 2. There are two types of nested classes
 *      A. Static Nested Class
 *      B. Inner Class (Non-static Nested Class)
 * 3. A static nested class has a static modifier along with its class definition. Because it is static, it must access
 *    the members of its enclosing class through an object. It cannot refer to members of its enclosing class directly.
 *    Because of this restriction, static nested classes are seldom used. In effect, a static nested class is
 *    behaviourally a top-level class that has been nested in another top-level class for packaging convenience.
 * 4. An inner class is a non-static nested class. It has access to all of the variables and methods of its outer class
 *    and may refer to them directly in the same way that other non-static members of the outer class do.
 * 5. A nested class is a member of its enclosing class. Non-static nested classes (inner classes) have access to other
 *    members of the enclosing class, even if they are declared private.Static nested classes do not have access to
 *    other members of the enclosing class.
 * 6. As a member of the OuterClass, a nested class can be declared private, public, protected, or package private.
 *    Please note that outer classes can only be declared public or package private.
 * 7. Inner Class can have same modifiers as for other class members: private, public, and protected.
 * 8. Uses of Nested Classes
 *      - It is a way of logically grouping classes that are only used in one place.
 *      - It increases encapsulation.
 *      - Nested classes can lead to more readable and maintainable code.
 */
public class P039_Classes_NestedClass_StaticAndInnerClass {

    public static void main(String args[]) {

        // Using Outer Class
        P035_Outer outerObject = new P035_Outer();
        outerObject.test();

        // Using Static Nested Class
        P035_Outer.StaticNestedClass staticNestedObject = new P035_Outer.StaticNestedClass();
        staticNestedObject.display();

        // Using Inner Class: Objects that are instances of an inner class exist within an instance of the outer class.
        P035_Outer.Inner innerObject = outerObject.new Inner();
        innerObject.display();
    }
}

// An Outer class containing an Inner Class
class P035_Outer {
    int outerX = 100;
    Inner inner = new Inner();

    // Inner class
    /* private */class Inner {
        void display() {
            System.out.println("Inside Inner Class");
            System.out.println("Can access Outer Class Variables. OuterX = " + outerX);
        }
    }

    // Using Inner Class Objects
    void test() {
        Inner inner = new Inner();
        inner.display();
    }

    static class StaticNestedClass {
        void display() {
            System.out.println("Inside Static Nested Class!");

            // Access outer class using an object
            P035_Outer outer = new P035_Outer();
            outer.test();
        }
    }
}