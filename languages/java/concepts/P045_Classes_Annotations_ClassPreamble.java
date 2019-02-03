package concepts;

//import this to use @Documented
import java.lang.annotation.*;

/*
 * Description: Class Preamble in Java
 * Note
 * 1. The annotation type definition looks somewhat like an interface definition where the keyword
 *    interface is preceded by the @ character (@ = "AT" as in Annotation Type.
 * 2. Annotation types are, in fact, a form of interface.
 * 3. To make the information in @ClassPreamble appear in Javadoc-generated documentation, you must
 *    annotate the @ClassPreamble definition itself with the @Documented annotation:
*/

@Documented
public @interface P045_Classes_Annotations_ClassPreamble {

    String author();
    String date();
    int currentRevision() default 1;
    String lastModified() default "N/A";
    String lastModifiedBy() default "N/A";

    // Note use of array
    String[] reviewers();
}