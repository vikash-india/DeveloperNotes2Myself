package concepts;

/*
 * Description: Statement Block in Java
 */
public class P010_StatementBlock {

    public static void main(String args[]) {

        int i = 0;

        {                                       // Start of a Statement Block
            int j = 1;
            System.out.println(i + "," + j);
        }                                       // End of the Statement Block

        System.out.println(i);
        // System.out.println(j);               // j will not be accessible here
    }
}