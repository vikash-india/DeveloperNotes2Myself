package concepts;

/*
 * Description: Generics - Raw Types
 * Note
 * 1. A raw type is the name of a generic class or interface without any type arguments.
 * 2. Raw types show up in legacy code because lots of API classes (such as the Collections classes) were not generic
 *    prior to JDK 5.0.
 * 3. When using raw types, you essentially get pre-generics behavior. Example, P069_Generic will give Objects.
 * 4. Raw Types should be avoided.
 * 5. Unchecked Error Messages: when mixing legacy code with generic code, one may encounter warning messages similar
 *    to the following:
 *      Note: Example.java uses unchecked or unsafe operations.
 *      Note: Recompile with -Xlint:unchecked for details.
 *    This can happen when using an older API that operates on raw types.
 */
public class P069_Generics_RawTypes {

    public static void main(String[] args) {

        // Normal way of creating a generic class
        P069_Generic<Integer> generic = new P069_Generic<Integer>();

        // If the actual type argument is omitted, you create a raw type of P239_Generic<T>
        P069_Generic rawGeneric = new P069_Generic();

        // Note 1: This is OK
        rawGeneric = generic;

        // Note 2: This will generate a warning: Unchecked Conversion
        generic = rawGeneric;

        // Note 3:
        // Warning: Unchecked invocation to set(T)
        // The warning shows that raw types bypass generic type checks, deferring
        // the catch of unsafe code to runtime. Therefore, AVOID using raw types.
        rawGeneric = generic;
        rawGeneric.set(8);
    }
}

class P069_Generic<T> {
    // T stands for "Type"
    private T t;

    public void set(T t) {
        this.t = t;
    }

    public T get() {
        return t;
    }
}