package concepts;

/*
 * Description: Constructor
 * Note
 * 1. A class contains constructors that are invoked to create objects from the class blueprint.
 * 2. Constructor declarations are like method declarations except that they use the name of
 *    the class and have no return type.
 * 3. All classes have at least one constructor. If a class does not explicitly declare any, the
 *    Java compiler automatically provides a no-argument constructor, called the default constructor.
 *    This default constructor calls the class parent's no-argument constructor, or the Object
 *    constructor if the class has no other parent. If the parent has no constructor (Object does have
 *    one), the compiler will reject the program.
 * 4. Access modifiers be used in a constructor's declaration to control which other classes can call
 *    the constructor. If another class cannot call a class constructor, it cannot directly create
 *    its objects.
 * 5. Even Constructor can be overloaded.
 */

public class P032_Classes_Constructor {

    public static void main(String args[]) {

        // Create boxes using the various constructors
        P028_Box mybox1 = new P028_Box(10, 20, 15);
        P028_Box mybox2 = new P028_Box();
        P028_Box mycube = new P028_Box(7);
        double volume;

        // Get volume of first box
        volume = mybox1.volume();
        System.out.println("Volume of mybox1 is " + volume);

        // Get volume of second box
        volume = mybox2.volume();
        System.out.println("Volume of mybox2 is " + volume);

        // Get volume of a cube
        volume = mycube.volume();
        System.out.println("Volume of mycube is " + volume);
    }
}

// Box has three overloaded constructors to initialise the dimensions of a box various ways.
class P028_Box {
    double width;
    double height;
    double depth;

    // Constructor used when all dimensions are specified
    P028_Box(double w, double h, double d) {
        width = w;
        height = h;
        depth = d;
    }

    // Constructor used when no dimension is specified
    P028_Box() {
        width = -1; // -1 to indicate an uninitialised box
        height = -1;
        depth = -1;
    }

    // Constructor used when a cube is created
    P028_Box(double len) {
        width = height = depth = len;
    }

    // Compute and return volume
    double volume() {
        return width * height * depth;
    }
}