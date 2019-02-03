package concepts;

/*
 * Description: Generics - Bounded Type Parameters
 * Note
 * 1. Bounded Type Parameters is a mechanism to restrict the types that can be used as type arguments in a parameterised
 *    type. For example, a method that operates on numbers might only want to accept instances of Number or its
 *    subclasses.
 * 2. To declare a bounded type parameter, list the type parameter's name, followed by the extends keyword, followed by
 *    its upper bound, which in this example is Number. The word extends is used in a general sense to mean either
 *    "extends" (as in classes) or "implements" (as in interfaces).
 * 3. A type variable with multiple bounds is a subtype of all the types listed in the bound. If one of the bounds is a
 *    class, it must be specified first or else it will result in compilation error.
 *              Class A { ... }
 *              interface B { ... }
 *              interface C { ... }
 *              class D <T extends A & B & C> { ... }
 */
public class P075_Generics_BoundedTypeParameters {

    public static void main(String[] args) {

        P071_Box<Integer> integerBox = new P071_Box<Integer>();
        integerBox.set(new Integer(10));

        // Error: this is still String! Compilation will fail integerBox.inspect("some text");

        // In addition to limiting the types you can use to instantiate a generic type, bounded type parameters
        // allow you to invoke methods defined in the bounds.
        System.out.println("Is Even: " + integerBox.isEven());
    }
}

// Multiple Bounds: A type parameter can have multiple bounds using the following syntax <T extends B1 & B2 & B3>.
class P071_Box<T extends Number> {

    private T t;

    public void set(T t) {
        this.t = t;
    }

    public T get() {
        return t;
    }

    public boolean isEven() {
        return t.intValue() % 2 == 0;
    }

    public <U extends Number> void inspect(U u) {
        System.out.println("T: " + t.getClass().getName());
        System.out.println("U: " + u.getClass().getName());
    }
}