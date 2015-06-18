package concepts;

/*
 * Description: Method Overriding in Java
 *
 * Method Overriding
 * 1. When an INSTANCE method in a subclass has the same signature ie same method name and same number and type of
 *    parameters as in its superclass, then the method in the subclass is said to override the method in the superclass.
 * 2. The ability of a subclass to override a method allows a class to inherit from a superclass whose behaviour is
 *    "close enough" and then to modify behaviour as needed.
 * 3. An overriding method can also return a subtype of the type returned by the overridden method. This is called a
 *    covariant return type.
 * 4. When overriding a method, once can use the @Override annotation that instructs the compiler that you intend to
 *    override a method in the superclass.
 * 5. The access specifier for an overriding method can allow more, but not less, access than the overridden method. For
 *    example, a protected instance method in the superclass can be made public, but not private, in the subclass.
 *
 * Method Hiding
 * 1. If a subclass defines a CLASS method with the same signature as a class method in the superclass, the method in
 *    the subclass hides the one in the superclass.
 *
 * Defining a Method with the Same Signature as a Superclass's Method
 *                                      Superclass Instance Method      Superclass Static Method
 *      ----------------------------------------------------------------------------------------
 *      Subclass Instance Method        Overrides                       Compile-time error
 *      Subclass Static Method          Compile-time error              Hides
 *
 * Note
 * 1. A compile-time error is generated if one changes an instance method in the superclass to a class method in the
 *    subclass, and vice versa.
 * 2. In a subclass, you can overload the methods inherited from the superclass. Such overloaded methods neither hide
 *    nor override the superclass methods. They are new methods, unique to the subclass.
 */
public class P050_Inheritance_MethodOverridingAndHiding {

    public static void main(String args[]) {
        P050_Parent parentObject = null;
        P050_Child childObject = null;

        childObject = new P050_Child();
        parentObject = new P050_Child();

        // Method Overriding: Child Instance Method gets called
        childObject.instanceMethod();
        parentObject.instanceMethod();

        // Method Hiding:
        childObject.classMethod();      // Child's Class Method gets called
        parentObject.classMethod();     // Parent's Class Method gets called
    }
}

// Method Overriding & Method Hiding
class P050_Parent {

    public static void classMethod() {
        System.out.println("This is Parent's Class Method");
    }

    // display i and j
    void instanceMethod() {
        System.out.println("This is Parent's Instance Method");
    }
}

/*
 * 1. The P050_Child class overrides the instanceMethod in P050_Parent and hides the classMethod in P050_Parent.
 * 2. The version of the hidden method that gets invoked is the one in the superclass, and the version of the overridden
 *    method that gets invoked is the one in the subclass.
 */
class P050_Child extends P050_Parent {

    public static void classMethod() {
        System.out.println("This is Child's Class Method");
    }

    // display k � this overrides show() in A
    void instanceMethod() {
        System.out.println("This is Child's Instance Method");
    }
}