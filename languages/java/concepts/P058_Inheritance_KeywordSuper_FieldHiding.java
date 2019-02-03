package concepts;

/*
 * Description: Field Hiding in Java
 * Note
 * 1. Within a class, a field that has the same name as a field in the superclass hides the superclass's field, even
 *    if their types are different.
 * 2. Within the subclass, the field in the superclass cannot be referenced by its simple name. Instead, the field must
 *    be accessed through super.
 * 3. Hiding fields should not be used as it makes code difficult to read.
 */
public class P058_Inheritance_KeywordSuper_FieldHiding {

    public static void main(String args[]) {

        P054_Parent parentObject = new P054_Parent(1, 2);
        P054_Child childObject = new P054_Child(3, 4, 5);

        System.out.println("Contents of Parent: ");
        parentObject.showA();
        System.out.println();

        // The subclass has access to all public members of its superclass.
        System.out.println("Contents of Child: ");
        childObject.showB();
        System.out.println();
    }
}

// Create a superclass.
class P054_Parent {
    protected int i, j;

    public P054_Parent(int i, int j) {
        this.i = i;
        this.j = j;
    }

    public void showA() {
        System.out.println("i = " + i);
        System.out.println("j = " + j);
    }
}

class P054_Child extends P054_Parent {
    protected int i;

    public P054_Child(int i, int j, int k) {
        super(i, j);
        this.i = k;
    }

    public void showB() {
        System.out.println("Child: i: " + i);
        // Field Hiding: super.i is used to access hidden field
        System.out.println("Parent i: " + super.i);
    }
}