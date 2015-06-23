package concepts;

/*
 * Description: Using Object as Parameters
 * Note
 * 1. Object is used as parameters for creating a clone of another object.
 * 2. Object as parameters have other uses also.
 */
public class P056_Inheritance_ObjectAsParameter {

    public static void main(String args[]) {

        P056_AnotherClass object1 = new P056_AnotherClass(100, 22);
        P056_AnotherClass object2 = new P056_AnotherClass(100, 22);
        P056_AnotherClass object3 = new P056_AnotherClass(-1, -1);

        System.out.println("object1 == object2: " + object1.equals(object2));
        System.out.println("object1 == object3: " + object1.equals(object3));
    }
}

// Objects may be passed to methods.
class P056_AnotherClass {
    int a, b;

    P056_AnotherClass(int a, int b) {
        this.a = a;
        this.b = b;
    }

    // Return true if object is equal to the invoking object
    boolean equals(P056_AnotherClass object) {
        if (object.a == a && object.b == b)
            return true;
        else
            return false;
    }
}