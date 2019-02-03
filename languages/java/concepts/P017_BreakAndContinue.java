package concepts;

/*
 * Description: Break and Continue Statement in Java
 * Note:
 *	1. Break and Continue works on the inner most loop.
 *	2. Break and Continue can be used with label to skip multiple loops.
 */
public class P017_BreakAndContinue {

    @SuppressWarnings("unused")
    public static void main(String args[]) {

        System.out.println("i\tj");
        System.out.println("---------");
        label1: for (int i = 0; i < 3; i++) {
            label2: for (int j = 0; j < 3; j++) {
                if (j == 1) {
                    // break;
                    break label1;                       // Not used often
                    // continue;
                    // continue label1;                 // Not used often
                }
                System.out.println(i + "\t" + j);
            }
        }
    }
}