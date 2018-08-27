package concepts;

/*
 * Description: Recursive Methods in Java
 * Note
 * 1. A function that calls itself is called recursive functions
 * 2. Direct Recursion: TODO
 * 3. Indirect Recursion: TODO
 */

public class P017_Methods_RecursiveMethods {

    public static void main(String args[]) {

        System.out.println(Factorial(5));
        System.out.println(FactorialWithoutRecursion(5));
    }

    public static long Factorial(int n) {

        if (n < 0) {
            return -1;
        } else if (n == 0) {
            return 1;
        } else {
            return n * Factorial(n - 1);
        }
    }

    public static long FactorialWithoutRecursion(int n) {

        int i;
        long result = 1;
        for (i = 1; i <= n; i++) {
            result *= i;
        }

        return result;
    }
}