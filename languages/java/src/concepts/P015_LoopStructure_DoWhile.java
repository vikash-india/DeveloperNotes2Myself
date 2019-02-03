package concepts;

/*
 * Description: Do-While Loop Structure in Java
 * Note
 * 1. The do-while loop is always executed at least once before the condition is checked.
 * 2. The loop gets executed till the condition remains true.
 */

public class P015_LoopStructure_DoWhile {

    public static void main(String args[]) {

        int i = 0;
        do {
            System.out.println(i);
            i++;
        } while (i < 5);
    }
}
