package concepts;

/*
 * Description: Generics - Generic Methods
 * Note
 *      1. Generic methods are methods that introduce their own type parameters.
 *      2. This is similar to declaring a generic type, but the type parameter's scope
 *         is limited to the method where it is declared.
 *      3. Static and non-static generic methods are allowed.
 *      4. Generic class constructors are also allowed.
 */
public class P070_Generics_GenericMethods {

    // Generic static method
    public static <K, V> boolean compare(P070_Pair<K, V> p1, P070_Pair<K, V> p2) {
        return p1.getKey().equals(p2.getKey()) && p1.getValue().equals(p2.getValue());
    }

    public static void main(String[] args) {
        P070_Pair<Integer, String> p1 = new P070_Pair<Integer, String>(1, "apple");
        P070_Pair<Integer, String> p2 = new P070_Pair<Integer, String>(2, "pear");

        // Type Inference: The type (<Integer, String>) has been explicitly provided. Generally, this can be left out
        // and the compiler will infer the type that is needed. This feature, known as type inference, allows you to
        // invoke a generic method as an ordinary method, without specifying a type between angle brackets.
        boolean same = P070_Generics_GenericMethods.<Integer, String> compare(p1, p2);
    }
}

class P070_Pair<K, V> {

    private K key;
    private V value;

    // Generic constructor
    public P070_Pair(K key, V value) {
        this.key = key;
        this.value = value;
    }

    // Generic methods
    public void setKey(K key) {
        this.key = key;
    }

    public void setValue(V value) {
        this.value = value;
    }

    public K getKey() {
        return key;
    }

    public V getValue() {
        return value;
    }
}