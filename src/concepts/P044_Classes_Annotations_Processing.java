package concepts;

/*
 * Description: Annotations Processing in Java
 * Note
 * 1. The more advanced uses of annotations include writing an annotation processor that can read a Java program and
 *    take actions based on its annotations.
 * 2. It might, for example, generate auxiliary source code, relieving the programmer of having to create boilerplate
 *    code that always follows predictable patterns.
 * 3. To facilitate this task, release 5.0 of the JDK includes an annotation processing tool, called apt. In release 6
 *    of the JDK, the functionality of apt is a standard part of the Java compiler.
 * 4. To make annotation information available at runtime, the annotation type itself must be annotated with
 *    @Retention(RetentionPolicy.RUNTIME), as follows
 *      import java.lang.annotation.*;
 *
 *      @Retention(RetentionPolicy.RUNTIME)
 *      @interface AnnotationForRuntime {
 *          // Elements that give information
 *          // for runtime processing
 *      }
 */
public class P044_Classes_Annotations_Processing {

    public static void main(String[] args) {

        // TODO: Complete this
    }
}

class P044_Annotations_Processing_Sample {
    // TODO: Complete this
}