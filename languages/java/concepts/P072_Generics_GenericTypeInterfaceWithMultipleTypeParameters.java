package concepts;

/*
 * Description: Generic Type Interface - With Multiple Type Parameter
 * Note
 * 1. Generic interface can also be created similarly to a Generic Class.
 * 2. Generic Interface should also follow the same naming convention.
 * 3. A type parameter (i.e., K or V) can be substituted with another parameterised type (i.e., List<String>). Example,
 *              OrderedPair<String, Box<Integer>> p = new OrderedPair<>("Primes", new Box<Integer>());
 */
public class P068_Generics_GenericTypeInterfaceWithMultipleTypeParameters {

    public static void main(String[] args) {

        // 1. Due to autoboxing, is it valid to pass a String and an int to the class
        P068_Pair<String, String> pair1 = new P068_OrderedPair<String, String>("Vikram", "Baital");
        P068_Pair<String, Integer> pair2 = new P068_OrderedPair<String, Integer>("Google", 1729);

        // Use the object
        // ...
    }
}

interface P068_Pair<K, V> {
    public K getKey();

    public V getValue();
}

class P072_OrderedPair<K, V> implements P068_Pair<K, V> {

    private K key;
    private V value;

    public P068_OrderedPair(K key, V value) {
        this.key = key;
        this.value = value;
    }

    public K getKey() {
        return key;
    }

    public V getValue() {
        return value;
    }
}
