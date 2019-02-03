package concepts;

/*
 * Description: Generics - Generic Sub Types
 * Note
 * 1. None
 */
public class P077_Generics_SubTypes {

    public static void main(String[] args) {

        // It is possible to assign an object of one type to an object of another type provided that the types are
        // compatible.
        Object someObject = new Object();
        Integer someInteger = new Integer(10);
        someObject = someInteger;       // OK

        // In object-oriented terminology, this is called an "is a" relationship. Since an Integer is a kind of Object,
        // the assignment is allowed. But Integer is also a kind of Number, so the following code is valid as well.
        someMethod(new Integer(10));    // OK
        someMethod(new Double(10.1));   // OK

        // The same is also true with generics.
        P073_Box<Number> box = new P073_Box<Number>();
        box.add(new Integer(10));       // OK
        box.add(new Double(10.1));      // OK
    }

    public static void someMethod(Number n) { /* ... */}
}

class P077_Box<T extends Number> {
    public <T extends Number> void add(T number) { /* ... */}

    // Note
    // 1. By looking at the below signature, it seems that it accepts a single argument whose type is Box<Number>. But
    //    we are NOT allowed to pass in Box<Integer> or Box<Double>, because Box<Integer> and Box<Double> are not
    //    subtypes of Box<Number>.
    // 2. Given two concrete types A and B (for example, Number and Integer), MyClass<A> has no relationship to
    //    MyClass<B>, regardless of whether or not A and B are related. The common parent of MyClass<A> and MyClass<B>
    //    is Object.
    public void boxTest(P073_Box<Number> n) { /* ... */}
}