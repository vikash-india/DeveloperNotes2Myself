package concepts;

/*
 * Description: Method Overloading
 * Note
 * 1. Overloaded methods are differentiated by the number and the type of the arguments passed into the method.
 * 2. There cannot be more than one method with the same name and the same number and type of arguments,
 * 3. Overloaded methods should be used sparingly, as they can make code much less readable.
 */
public class P056_Inheritance_Polymorphism_MethodOverloading {

    public static void main(String args[]) {

        P056_Inheritance_Polymorphism_MethodOverloading object = new P056_Inheritance_Polymorphism_MethodOverloading(1,
                2);

        // Calling Overloaded Methods
        object.addToMembers(10);
        object.addToMembers(10, 20);
    }

    private int i, j;

    // Overloaded Constructors
    P056_Inheritance_Polymorphism_MethodOverloading(int i, int j) {
        this.i = i;
        this.j = j;
        System.out.println("i,j = " + i + "," + j);
    }

    P056_Inheritance_Polymorphism_MethodOverloading(int i) {
        this.i = i;
        this.j = 0;
        System.out.println("i,j = " + i + "," + j);
    }

    P056_Inheritance_Polymorphism_MethodOverloading() {
        this.i = 0;
        this.j = 0;
        System.out.println("i,j = " + i + "," + j);
    }

    // Overloaded Methods
    public void addToMembers(int a, int b) {
        i = i + a;
        j = j + b;

        System.out.println("addToMembers: i,j = " + i + "," + j);
    }

    public void addToMembers(int a) {
        i = i + a;
        j = j + a;

        System.out.println("addToMembers: i,j = " + i + "," + j);
    }
}