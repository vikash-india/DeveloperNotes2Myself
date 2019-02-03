package concepts;

/*
 * Description: A Generic Type Class
 * Notes
 * 1. Generics enable types (classes and interfaces) to be parameters when defining classes, interfaces and methods.
 *    Like formal parameters used in method declarations, type parameters provide a way to re-use the same code with
 *    different inputs.
 *    The difference is that the inputs to formal parameters are values, while the inputs to type parameters are types.
 * 2. A generic type is a generic class or interface that is parameterised over types.
 * 3. A generic class is defined with the following format
 *              class name<T1, T2, ..., Tn> { ... }
 *    The type parameter section, delimited by angle brackets (<>), follows the class name. It specifies the type
 *    parameters (also called type variables) T1, T2, ..., and Tn.
 * 4. Type Parameter Naming Conventions
 *      - By convention, type parameter names are single, upper case letters. This stands in sharp contrast to the
 *        variable naming conventions.
 *      - The most commonly used type parameter names are
 *              E - Element (used extensively by the Java Collections Framework)
 *              K - Key
 *              N - Number
 *              T - Type
 *              V - Value
 *              S,U,V etc. - 2nd, 3rd, 4th types
 * 5. Advantages of Generics
 *      - Stronger type checks at compile time.
 *      - Elimination of casts.
 *      - Enabling programmers to implement generic algorithms.
 * 6. Generic interface can also be created similarly.
 */
public class P071_Generics_GenericTypeClass {

    public static void main(String[] args) {

        // Invoking and Instantiating a Non-Generic Type
        P067_NonGeneric nonGenericClass = new P067_NonGeneric();
        nonGenericClass.set(new Integer(101));
        int value = (Integer) nonGenericClass.get();
        System.out.println("Non Generic Value = " + value);

        /**
         *
         * Invoking and Instantiating a Generic Type <br/>
         * 1. For generic type invocation, which replaces T with some concrete value, say Integer.<br/>
         * 2. Type Parameter and Type Argument Terminology: The terms "type parameter" and "type argument" are used<br/>
         *    interchangeably, but these terms are not the same. When coding, one provides type arguments in order <br/>
         *    to create a parameterised type. Therefore, the T in Foo<T> is a type parameter and the String in<br/>
         *    Foo<String> f is a type argument.<br/>
         * 3. An invocation of a generic type is generally known as a parameterised type.<br/>
         * 4. The Diamond: In Java SE 7 and later, the type arguments required to invoke the constructor of a <br/>
         *    generic class can be replace with an empty set of type arguments (<>) as long as the compiler can <br/>
         *    determine, or infer, the type arguments from the context.<br/>
         *    P067_Generic<Integer> genericClass = new P067_Generic<>();
         */
        P067_Generic<Integer> genericClass = new P067_Generic<Integer>();
        genericClass.set(new Integer(12));
        int i = genericClass.get();
        System.out.println("Generic Value = " + i);
    }
}

/*
 * Creating a Non-Generic Class
 */
class P067_NonGeneric {
    private Object object;

    public void set(Object object) {
        this.object = object;
    }

    public Object get() {
        return object;
    }
}

/**
 * Creating Generic version of the above class.
 * Notes
 * 1. A type variable can be any non-primitive type you specify: any class type, any interface type, any array type,
 *    or even another type variable.
 */
class P067_Generic<T> {
    // T stands for "Type"
    private T t;

    public void set(T t) {
        this.t = t;
    }

    public T get() {
        return t;
    }
}