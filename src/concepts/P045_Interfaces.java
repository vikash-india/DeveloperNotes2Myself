package concepts;

/*
 * Description: Interfaces in Java
 * Note
 * 1.  An interface is a reference type, similar to a class, that can contain only constants, method signatures, and
 *     nested types.
 * 2.  There are no method bodies. Interfaces cannot be instantiated, they can only be implemented by classes or
 *     extended by other interfaces. In other words it declares what certain classes do. However the interface itself
 *     does nothing.
 * 3.  Interfaces add most of the functionality that is required for many applications which would normally resort to
 *     using multiple inheritance in a language such as C++.
 * 4.  The methods of an interface are abstract - they have no bodies.
 * 5.  Access is either public or not used. When no access specifier is included, then default access results, and
 *     the interface is only available to other members of the package in which it is declared.
 * 6.  Variables can be declared inside of interface declarations. They are implicitly final and static, meaning they
 *     cannot be changed by the implementing class. They must also be initialised with a constant value.
 * 7.  All methods and variables are implicitly public if the interface, itself, is declared as public.
 * 8.  Interfaces can be extended.
 * 9.  A class may implement one or more interfaces.
 * 10. If a class implements two interfaces that declare the same method, then the same method will be used by clients
 *     of either interface. The methods that implement an interface must be declared public.
 * 11. You can declare variables as object references that use an interface rather than a class type. Any instance of
 *     any class that implements the declared interface can be referred to by such a variable.
 * 12. Because dynamic lookup of a method at run time incurs a significant overhead when compared with the normal
 *     method invocation in Java, you should be careful not to use interfaces casually in performance-critical code.
 * 13. If a class includes an interface but does not fully implement the methods defined by that interface, then that
 *     class must be declared as abstract.
 * 14. 3 Class file will be created when this is compiled, namely,
 *      P045_Interfaces.class
 *      P045_Interfaces_Counting.class
 *      P045_Interfaces_StopWatch.class
 * 15. Uses of Interface
 *      - Interfaces as APIs: Please note that if another method has to be added for an existing interface then a new
 *        interface should be created by extending the old one. This way old legacy code will continue to run and new
 *        API can be taken advantages of by newly written code.
 *      - For multiple Inheritance
 */

public class P045_Interfaces {

    public static void main(String args[]) {

        P045_StopWatch stopWatch = new P045_StopWatch();
        stopWatch.increment();
        stopWatch.increment();
        System.out.println(stopWatch.getValue());
    }
}

// Interface Definition
interface P045_Counting {
    // Constant declarations, if any

    // Method signatures: The method signatures have no braces and are terminated with a semicolon.
    abstract void increment();

    abstract int getValue();
}

// Interface Implementation: To use an interface, a class should use the keyword implements or extends.
class P045_StopWatch implements P045_Counting {
    int counter;

    P045_StopWatch() {
        counter = 0;
    }

    // Implementation is entirely specific to class but method signature should match
    public void increment() {
        counter++;
    }

    // Implementation is entirely specific to class but method signature should match
    public int getValue() {
        return counter;
    }

    // Other Class methods and data members can be also be present
}