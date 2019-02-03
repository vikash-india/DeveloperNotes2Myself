package concepts;

/*
 * Description: this Keyword
 * Note:
 * 1. The keyword 'this' is a reference to the current object.
 * 2. The most common reason for using the this keyword is because a field is shadowed by a method or constructor
 *    parameter.
 * 3. The 'this' keyword is also used to call another constructor from the same constructor. This is true only for
 *    constructor.
 */

public class P034_Classes_ThisKeyword {

    public static void main(String args[]) {

        P030_Point point = new P030_Point(1, 2, 3);
        point.show();
    }
}

class P030_Point {
    public int x = 0; // These are default values to the fields
    public int y = 0; // These are default values to the fields

    // Constructor
    public P030_Point(int x, int y) {
        this.x = x; // Using just x refers to the value coming from the parameter and it shadows the class field.
        this.y = y;
    }

    public P030_Point(int x, int y, int z) {
        this(y, z); // Calling the Constructor using the keyword this
        System.out.println("Ignored the parameter x: " + x);
    }

    public void show() {
        System.out.println("x = " + x);
        System.out.println("y = " + y);
    }
}
