package concepts;

/*
 * Description: Abstract Classes and Abstract Methods in Java
 * Abstract Class
 * 1. An abstract class is a class that is declared abstract. Abstract class cannot be instantiated. So the following
 *     statement will give compilation error.
 *              Animal a = new Animal();
 * 2. Abstract Class may or may not include abstract methods.
 * 3. When an abstract class is subclassed, the subclass usually provides implementations for all of the abstract
 *    methods in its parent class. However, if it does not, the subclass must also be declared abstract.
 * 4. A class that implements an interface must implement all of the interface's methods. It is possible, to define a
 *    class that does not implement all of the interface methods, provided that the class is declared to be abstract.
 * 5. An abstract class may have static fields and static methods.
 *      Abstract Method
 *      1. Abstract Method MUST be implemented in the inherited class.
 *      2. All of the methods in an interface are implicitly abstract, so the abstract modifier is not used with
 *         interface methods.
 *	3. Non-Abstract methods MAY or MAY NOT be overridden.
 *
 *      Abstract Classes versus Interfaces
 *      1. Unlike interfaces, abstract classes can contain fields that are not static and final.
 *      2. Abstract class can contain implemented methods.
 *      3. If an abstract class contains only abstract method declarations, it should be declared as an interface
 *         instead.
 *      4. Multiple interfaces can be implemented by classes anywhere in the class hierarchy, whether or not they are
 *         related to one another in any way.
 */
public class P062_Inheritance_AbstractClassesAndMethods {

    public static void main(String args[]) {

        P058_Dog animal1 = new P058_Dog();
        P058_Cat animal2 = new P058_Cat();
        P058_Duck animal3 = new P058_Duck();

        System.out.println("A dog says " + animal1.sayHello() + ", is carnivorous: " + animal1.isCarnivorous()
                + ", and is a mammal: " + animal1.isAMammal());
        System.out.println("A cat says " + animal2.sayHello() + ", is carnivorous: " + animal2.isCarnivorous()
                + ", and is a mammal: " + animal2.isAMammal());
        System.out.println("A duck says " + animal3.sayHello() + ", is carnivorous: " + animal3.isCarnivorous()
                + ", and is a mammal: " + animal3.isAMammal());
    }
}

abstract class P058_Animal {
    // May or May NOT be overridden.
    public boolean isAMammal() {
        return (true);
    }

    // May or May NOT be overridden.
    public boolean isCarnivorous() {
        return (true);
    }

    // Must be implemented in the inherited class
    abstract public String sayHello();
}

class P058_Dog extends P058_Animal {
    public String sayHello() {
        return ("Bark");
    }
}

class P058_Cat extends P058_Animal {
    public String sayHello() {
        return ("Meow");
    }
}

class P058_Duck extends P058_Animal {
    // Overridden methods from base class
    public boolean isAMammal() {
        return (false);
    }

    // Overridden methods from base class
    public boolean isCarnivorous() {
        return (false);
    }

    public String sayHello() {
        return ("Quack");
    }
}