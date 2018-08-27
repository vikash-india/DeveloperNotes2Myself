package concepts;

/*
 * Description: Packages - Multiple Classes in a Single Source File
 * Note
 * 1. Compilation of this program will create 3 class files, namely,
 *      P065_Packages_MultipleClassesInAFile.class,
 *      HelloWorld.class,
 *      GoodbyeWorld.class
 * 2. All 3 classes are completely independent classes
 * 3. These class files run and execute independently of each other although they exist in the same source code file.
 */
public class P065_Packages_MultipleClassesInAFile {

    public static void main(String args[]) {

        System.out.println("Hello Class!");
    }
}

class P235_HelloWorld {
    public static void main(String args[]) {
        System.out.println("Hello World");
    }
}

class P235_GoodByeWorld {
    public static void main(String args[]) {
        System.out.println("Goodbye Cruel World!");
    }
}