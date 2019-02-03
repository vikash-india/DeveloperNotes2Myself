package concepts;

/*
 * Description: Anonymous Classes in Java
 * Note
 * 1. Anonymous Classes are defined within a method and does not have a name.
 * 2. Since anonymous classes have no name, objects can not be instantiated from outside the class in which the
 *    anonymous class is defined. In fact, an anonymous object can only be instantiated from within the same scope in
 *    which it is defined.
 * 3. It combines the class declaration and the creation of an instance of the class in a single step.
 * 4. Properties of an Anonymous Class
 *      - An anonymous class must always extend a super class or implement an interface but it cannot have an explicit
 *        extends or implements clause.
 *      - An anonymous class must implement all the abstract methods in the super class or the interface.
 *      - An anonymous class always uses the default constructor from the super class to create an instance.
 * 5. Uses of an Anonymous Class
 *      - Same as Nested Classes
 *      - Anonymous classes can be time-savers and reduce the number of .java files necessary to define an application.
 *         Example: You may have a class that is only used in a specific situation such as a Comparator. This allows an
 *         "on the fly" creation of an object.
 * 6. Types of Nested Classes
 *      Type                            Scope                                   Inner
 *      -----------------------------------------------------------------------------
 *      static nested class             member                                  no
 *      inner [non-static] class        member                                  yes
 *      local class                     local                                   yes
 *      anonymous class                 only the point where it is defined      yes
 */

public class P041_Classes_NestedClass_AnonymousInnerClass {

    public static void main(String args[]) {

        Ball b = new Ball() { // Anonymous Class
            public void hit() {
                System.out.println("You hit it!");
            }
        };
        b.hit();
    }

    interface Ball {
        void hit();
    }
}