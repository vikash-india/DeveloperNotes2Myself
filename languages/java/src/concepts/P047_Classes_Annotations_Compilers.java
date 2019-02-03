package concepts;

/*
 * Description: Annotations used by the Compiler
 * Note
 * 1. There are three annotation types that are predefined by the language specification itself
 *      @Deprecated, @Override, and @SuppressWarnings.
 * 2. @Deprecated Compiler Annotations
 *      - The compiler generates a warning whenever a program uses a method, class, or field with the @Deprecated
 *        annotation.
 *      - When an element is deprecated, it should also be documented using the Javadoc @deprecated tag.
 * 3. @Override
 *      - The @Override annotation informs the compiler that the element is meant to override an element declared in a
 *        superclass.
 *      - While it's not required to use this annotation when overriding a method, it helps to prevent errors. If a
 *        method marked with @Override fails to correctly override a method in one of its superclasses, the compiler
 *        generates an error.
 * 4. @SuppressWarnings
 *      - The @SuppressWarnings annotation tells the compiler to suppress specific warnings that it would otherwise
 *        generate.
 *      - The Java Language Specification lists two categories: "deprecation" and "unchecked." The "unchecked" warning
 *        can occur when interfacing with legacy code written before the advent of generics.
 *      - To suppress more than one category of warnings, use the following syntax
 *              @SuppressWarnings({"unchecked", "deprecation"})
 */
public class P047_Classes_Annotations_Compilers {

    public static void main(String[] args) {

    }
}

class P043_Sample {
    // Deprecated Annotation
    /**
     * @deprecated explanation of why it was deprecated
     */
    @Deprecated
    static void deprecatedMethod() {}

    // Override Annotation
    @Override
    public String toString() {
        return null;
    }

    // Suppress Warnings Annotation: Use a deprecated method and tell compiler not to generate a warning
    @SuppressWarnings("deprecation")
     void useDeprecatedMethod() {
         // Deprecation warning suppressed
         // object.deprecatedMethod();
     }
}
