package concepts;

/*
 * Description: Inheritance in Java
 * Note
 * 1. A class that is derived from another class is called a subclass (also a derived class, extended class, or child
 *    class). The class from which the subclass is derived is called a superclass (also a base class or a parent class).
 * 2. Keyword 'extends' is used to inherit a class.
 * 3. Although a subclass includes all of the members of its superclass, it cannot access those members of the
 *    superclass that have been declared as private.
 * 4. Constructors are not members, so they are not inherited by subclasses, but the constructor of the superclass can
 *    be invoked from the subclass.
 * 5. Except Object (defined in the java.lang package), which has no superclass, every class has one and only one direct
 *    superclass (single inheritance).
 * 6. Multiple Inheritance is not allowed in JAVA i.e. only one class can be inherited by a class.
 * 7. A Superclass variable can reference a subclass object.
 */
public class P048_Inheritance {

    public static void main(String args[]) {

        P048_Parent superObject = new P048_Parent();
        P048_Child subObject = new P048_Child();

        // The superclass may be used by itself.
        superObject.i = 10;
        superObject.j = 20;
        System.out.println("Contents of superObject: ");
        superObject.showA1();
        System.out.println();

        // The subclass has access to all public members of its superclass.
        subObject.i = 7;
        subObject.j = 8;
        subObject.k = 9;
        System.out.println("Contents of subObject: ");
        subObject.showA1();
        subObject.showB1();
        System.out.println();
        System.out.println("Sum of i, j and k in subObject:");
        subObject.sum();

        // Super class variable can access sub class object
        superObject = subObject;
        superObject.i = 8;
        superObject.j = 12;
        // Error since super class variable can access only those member which are present in super class
        // superObject.k = 3;
        // superObject.sum();
        System.out.println();
        System.out.println("Contents of superObject accessing subObject: ");
        superObject.showA1();
    }
}

// Create a superclass.
class P048_Parent {
    public int i, j;

    public P048_Parent() {}

    public void showA1() {
        System.out.println("i = " + i);
        System.out.println("j = " + j);
    }
}

// Create a subclass by extending class A.
/*
 * Subclass can do the following
 * 1. The inherited fields can be used directly, just like any other fields.
 * 2. The inherited methods can be used directly as they are.
 * 3. A field in the subclass with the same name as the one in the superclass can be declared, thus hiding it (not
 *    recommended).
 * 4. Superclass methods can be overridden.
 * 5. A new static method in the subclass can be added that has the same signature as the one in the superclass, thus
 *    hiding it.
 * 6. New fields & methods can be added in the subclass can that are not in the superclass.
 * 7. You can write a subclass constructor that invokes the constructor of the superclass, either implicitly or by
 *    using the keyword super.
 */
class P048_Child extends P048_Parent {
    public int k;

    public P048_Child() {}

    public void showB1() {
        System.out.println("k: " + k);
    }

    public void sum() {
        System.out.println("i + j + k: " + (i + j + k));
    }
}