package concepts;

/*
 * Description: Arrays in Java
 * Note
 * 1. An array is a group of variables that share the same name and are ordered sequentially from zero to one less than
 *    the number of variables in the array.
 * 2. The number of variables that can be stored in an array is called the array's dimension.
 * 3. Each variable in the array is called an element of the array.
 * 4. There are three steps to creating an array - declaring it, allocating it and initialising it.
 * 5. Declaring an array does not create the array.
 * 6. Unlike two-dimensional C arrays, two-dimensional Java arrays are not just one-dimensional arrays indexed in a
 *    funny way.
 * 7. ArrayIndexOutOfBounds exception occurs whenever you exceed the maximum array index.
 * 8. Any dimension of arrays can be created.
 * 9. Arrays can be accessed using 0-based indexes.
 */

public class P005_DataType_Arrays {

    public static void main(String args[]) {

        // Declaring an array.
        int[] arrayInt;         // int[] arrayInt is same as int arrayInt[];
        float[] arrayFloat;
        String[] arrayNames;

        // Allocating an array.
        arrayInt = new int[3];
        arrayFloat = new float[7];
        arrayNames = new String[50];

        // Initialising Array Elements
        arrayInt[0] = 2;
        arrayInt[1] = 5;
        arrayInt[2] = -2;
        arrayFloat[6] = 7.5f;
        arrayNames[4] = "Dilbert";

        // Declaring and Allocating arrays in the same statement
        int[] arrayInt2 = new int[3];

        // Declaring, Allocating and Initialising array at the same time
        int[] arrayInt3 = { 1, 2, 3 };
        String arrayNames2[] = { "AAAA", "BBBB", "CCCC" };

        // 2-D Dimensional Arrays
        int[][] array2Dimensional;                      // 2-D array Declaration
        array2Dimensional = new int[4][5];              // 2-D array Allocation
        for (int row = 0; row < 4; row++) {             // 2-D array Initialisation
            for (int col = 0; col < 5; col++) {
                array2Dimensional[row][col] = row + col;
            }
        }

        // 3-D Dimensional Arrays
        int[][][] array3Dimensional;                    // 3-D array Declaration
        array3Dimensional = new int[4][5][3];           // 3-D array Allocation
        for (int row = 0; row < 4; row++) {             // 3-D array Initialisation
            for (int col = 0; col < 5; col++) {
                for (int ver = 0; ver < 3; ver++) {
                    array3Dimensional[row][col][ver] = row + col + ver;
                }
            }
        }
        System.out.println(arrayNames[4]);

        // Copying Arrays
        char[] copyFrom = { 'd', 'e', 'c', 'a', 'f', 'f', 'e', 'i', 'n', 'a', 't', 'e', 'd' };
        char[] copyTo = new char[7];
        System.arraycopy(copyFrom, 2, copyTo, 0, 7);

        // Print values
        System.out.println(arrayInt2[0]);
        System.out.println(arrayInt3[1]);
        System.out.println(arrayNames2[2]);
    }
}