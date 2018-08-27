package concepts;

/*
 * Description: Annotations in Java
 * Note
 * 1. Annotations provide data about a program that is not part of the program itself. They have no direct effect on
 *    the operation of the code they annotate.
 * 2. Annotations can be applied to a program's declarations of classes, fields, methods, and other program elements.
 * 3. The annotation appears first, often (by convention) on its own line, and may include elements with named or
 *    unnamed values
 *      @author(
 *          name = "Benjamin Franklin",
 *          date = "2003-03-27"
 *      )
 *      class MyClass() { }
 * 4. Uses of Annotations
 *      - Information for the compiler: Annotations can be used by the compiler to detect errors  or suppress warnings.
 *      - Compiler-time and deployment-time processing: Software tools can process annotation information to generate
 *        code, XML files, and so forth.
 *      - Runtime processing: Some annotations are available to be examined at runtime.
 */
public class P040_Classes_Annotations {

    public static void main(String[] args) {

    }
}

class P040_MyClass {
    @SuppressWarnings(value = "unchecked")
    void myMethod1() {}

    // If there is just one element named "value," then the name may be omitted.
    @SuppressWarnings("unchecked")
    void myMethod2() {}

    // If an annotation has no elements, the parentheses may be omitted.
    @Override
    public String toString() {
        return null;
    }
}