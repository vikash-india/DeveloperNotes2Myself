package concepts;

/*
 * Description: Comments in Java
 * Note
 * 1. // is used for single line comments.
 * 2. /* is used for multi-line comments.
 * 3. /** is used for documentation comments. Java SDK tool javadoc uses these comments to generate HMTL
 * documentation to describe a class.
 */

/**
 * 1. This is a javadoc comments. This is used by javadoc tool to create documentation. <br />
 * 2. Asterisks inside the comments are ignored by javadoc but can be make nice line markers. <br />
 * 3. Basic HTML tags can be used within javadoc comments. <br />
 */
public class P002_Comments {
    /*
     * This is an example of a multi-line comments. Multi-line comments can span over multiple lines.
     */
    public static void main(String args[]) {

        // This is a single Line comment
        System.out.println("Various types of comments in Java");
    }
}