package concepts;

/*
 * Description: Using Objects as Parameters
 * Note
 * 1. The Object class, in the java.lang package, sits at the top of the class hierarchy tree.
 * 2. Every class is a descendant, direct or indirect, of the Object class.
 */
public class P055_Inheritance_Object implements Cloneable {

    public static void main(String args[]) {

        /*
         * Object.clone method:
         * 1. If a class, or one of its superclass, implements the Cloneable interface, then one can use the clone()
         *    method to create a copy from an existing object.
         * 2. For some classes, the default behaviour of Object's clone() method works just fine. If, however, an object
         *    contains a reference to an external object, say ObjExternal, you may need to override clone() to get
         *    correct behaviour.
         */
        P055_Parent parent = new P055_Parent();
        Object object = (Object) parent.clone();
        System.out.println(object.toString());

        /*
         * Object.equals method:
         * 1. The equals() method compares two objects for equality and returns true if they are equal.
         * 2. The equals() method provided in the Object class uses the identity operator (==) to determine whether two
         *    objects are equal. For primitive data types, this gives the correct result. For objects, however, it does
         *    not.
         * 3. The equals() method provided by Object tests whether the object references are equal, that is, if the
         *    objects compared are the exact same object.
         * 4. If you override equals(), you must override hashCode() as well.
         */
        P055_Book book1 = new P055_Book("ISBN-1");
        P055_Book book2 = new P055_Book("ISBN-2");
        if (book1.equals(book2)) {
            System.out.println("Objects are equal");
        } else {
            System.out.println("Objects are not equal");
        }

        /*
         * Object.finalize method:
         * 1. The Object class provides a callback method, finalize(), that may be invoked on an object when it becomes
         *    garbage.
         * 2. Object's implementation of finalize() does nothing. One can override finalize() to do cleanup, such as
         *    freeing resources.
         * 3. The finalize() method may be called automatically by the system, but when it is called, or even if it is
         *    called, is uncertain. So don't rely on them.
         */
        // TODO: Add code here.

        /*
         * Object.getClass method: 1. The getClass() method returns a Class object, which has methods you can use to get
         * information about the class, such as its name. 2. getClass cannot be overridden. 3. The Class class, in the
         * java.lang package, has a large number of methods (more than 50) to test if the class is an annotation
         * (isAnnotation()), an interface (isInterface()) etc.
         */
        System.out.println("The object's class is " + book1.getClass().getSimpleName());

        /*
         * Object.hashCode method:
         * 1. The value returned by hashCode() is the object's hash code, which is the object's memory address in
         *    hexadecimal.
         * 2. By definition, if two objects are equal, their hash code must also be equal. If you override the
         *    equals() method, you change the way two objects are equated and Object's implementation of hashCode() is
         *    no longer valid. Therefore override hashCode() also.
         */
        // TODO: Add code here.

        /*
         * Object.toString method:
         * 1. The Object's toString() method returns a String representation of the object, which is very useful for
         *    debugging.
         * 2. The String representation for an object depends entirely on the object, which is why you need to override
         *    toString() in your classes.
         */
        System.out.println(book1.toString());
    }
}

class P055_Parent {

    // [protected | public] Object clone() throws CloneNotSupportedException
    @Override
    protected Object clone() {
        Object object = new Object();

        // DO SOMETHING
        return object;
    }
}

class P055_Book {
    private String ISBN;

    P055_Book(String ISBN) {
        this.ISBN = ISBN;
    }

    @Override
    public boolean equals(Object object) {
        if (object instanceof P055_Book)
            return ISBN.equals(((P055_Book) object).getISBN());
        else
            return false;
    }

    @Override
    public int hashCode() {
        // TODO: Add code here
        return 0;
    }

    public String getISBN() {
        return ISBN;
    }

    public String toString() {

        return "Book: ISBN = " + ISBN;
    }
}