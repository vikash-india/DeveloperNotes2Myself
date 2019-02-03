package concepts;

/*
 * Description: The instanceof Operator and Explicit Type Casting in Java
 * Note
 * 1. The instanceof operator compares an object to a specified type.
 */
public class P053_Inheritance_InstanceOfAndTypeCasting {

    public static void main(String[] args) {

        P049_Parent parentObject = null;
        P049_Parent childObject = null;
        P049_Interface interfaceObject = null;

        // Test for Parent
        parentObject = new P049_Parent();
        System.out.println("parentObject instanceof Parent: " + (parentObject instanceof P049_Parent));
        System.out.println("parentObject instanceof Child: " + (parentObject instanceof P049_Child));
        System.out.println("parentObject instanceof MyInterface: " + (parentObject instanceof P049_Interface));

        // Test for Child
        childObject = new P049_Child();
        System.out.println();
        System.out.println("childObject instanceof Parent: " + (childObject instanceof P049_Parent));
        System.out.println("childObject instanceof Child: " + (childObject instanceof P049_Child));
        System.out.println("childObject instanceof MyInterface: " + (childObject instanceof P049_Interface));

        // Test for Child through its Parent Object
        parentObject = new P049_Child(); // Implicit Typecasting
        System.out.println();
        System.out.println("parentObject instanceof Parent: " + (parentObject instanceof P049_Parent));
        System.out.println("parentObject instanceof Child: " + (parentObject instanceof P049_Child));
        System.out.println("parentObject instanceof MyInterface: " + (parentObject instanceof P049_Interface));

        // Test for Interface
        interfaceObject = new P049_Child();
        System.out.println();
        System.out.println("interfaceObject instanceof Parent: " + (interfaceObject instanceof P049_Parent));
        System.out.println("interfaceObject instanceof Child: " + (interfaceObject instanceof P049_Child));
        System.out.println("interfaceObject instanceof MyInterface: " + (interfaceObject instanceof P049_Interface));

        // Implicit Typecasting
        Object object = new P049_Parent();
        parentObject = new P049_Child();
        object.toString();

        // Explicit Typecasting: This cast inserts a runtime check that childObject is assigned a
        // P049_Child so that the compiler can safely assume that childObject is a P049_Child.
        childObject = (P049_Child) parentObject;
    }
}

class P049_Parent {}

class P049_Child extends P049_Parent implements P049_Interface {}

interface P049_Interface {}
