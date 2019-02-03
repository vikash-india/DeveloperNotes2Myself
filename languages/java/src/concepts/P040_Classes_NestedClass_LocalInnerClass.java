package concepts;

/*
 * Description: Nested Classes - Local Inner Class in Java
 * Note
 * 1. Classes defined within a method are called Local Inner Classes.
 * 2. There are two types of Inner classes i.e. classes defined within a method
 *      A. Local Inner Class
 *	B. Anonymous  Inner Class
 * 3. Uses of Local Inner Classes
 *      - Same as Nested Class
 */

public class P040_Classes_NestedClass_LocalInnerClass {

    interface MyInterface {
        public void display();
    }

    public static void main(String args[]) {

        class P036_LocalInnerClass implements MyInterface {

            private String value = "Local Inner Class";

            public void display() {
                System.out.println("Inside Display: " + value);
            }

            public void displayAgain() {
                System.out.println("Inside displayAgain");
            }
        }

        // Using Local Inner Class
        P036_LocalInnerClass innerObject1 = new P036_LocalInnerClass();
        innerObject1.display();

        P036_LocalInnerClass innerObject2 = new P036_LocalInnerClass();
        innerObject2.display();
        innerObject2.displayAgain();
    }
}