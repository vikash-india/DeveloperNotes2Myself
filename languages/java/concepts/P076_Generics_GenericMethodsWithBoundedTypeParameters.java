package concepts;

/*
 * Description: Generics - Generic Methods with Bounded Type Parameters
 * Notes
 * 1. Bounded type parameters are key to the implementation of generic algorithms.
 */
public class P076_Generics_GenericMethodsWithBoundedTypeParameters {

    public static void main(String[] args) {

    }

    public static <T> int countGreaterThanWithoutBoundedTypeParameters(T[] anArray, T elem) {
        int count = 0;
        for (T e : anArray) {
            // Note: Compilation Error because because the greater than operator (>) applies only to primitive types
            // such as short, int, double, long, float, byte, and char. The > operator cannot be used to compare
            // objects.
            // if (e > elem)

            ++count;
        }

        return count;
    }

    // To fix the above problem, use a type parameter bounded by the following
    // Comparable<T> interface:
    public interface Comparable<T> {
        public int compareTo(T o);
    }

    public static <T extends Comparable<T>> int countGreaterThanWithBoundedTypeParameters(T[] anArray, T elem) {
        int count = 0;
        for (T e : anArray)
            // Note: This works fine
            if (e.compareTo(elem) > 0)
                ++count;
        return count;
    }
}