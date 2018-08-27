package concepts;

import java.util.ArrayList;

/*
 * Description: Static Variables or Class Level Variables
 * Note
 * 1. The static data is initialised to 0 by default.
 * 2. It can be initialised to any value using a static block or along with its declaration.
 * 3. Static data members should be accessed using class names rather than instance variables.
 */

public class P032_Classes_StaticVariables {

    public static void main(String args[]) {

        System.out.println("Value of i: " + P032_Sample.i);
        System.out.println("Size of ArrayList is: " + P032_Sample.myList.size());
    }
}

class P032_Sample {
    static int i = 24;
    /*
     * 1. A class can have any number of static initialisation blocks, and they can appear anywhere in the class body.
     *    The runtime system guarantees that static initialisation blocks are called in the order that they appear in
     *    the source code.
     */
    static ArrayList<Integer> myList;
    static {
        myList = new ArrayList<Integer>();
        myList.add(1);
        myList.add(2);
        myList.add(3);
    }

    // Non-Static variables can be initialised using non-static block
    ArrayList<Integer> myNonStaticList;
    {
        myNonStaticList = new ArrayList<Integer>();
        myNonStaticList.add(1);
        myNonStaticList.add(2);
        myNonStaticList.add(3);
    }
}