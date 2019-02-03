package concepts;

/*
 * Description: Using Annotations as Documentation Comments
 * Note
 * 1. Many annotations replace what would otherwise have been comments in code.
 * 2. To add metadata with an annotation, you must first define the annotation type. Check
 *    P216_Classes_Annotations_ClassPreamble.java
 * 3. TODO: Complete this.
 */
public class P046_Classes_Annotations_Documentations {

    public static void main(String[] args) {

    }
}

@P041_Classes_Annotations_ClassPreamble(
        author = "Vikash",
        date = "10-Oct-2004",
        currentRevision = 6,
        lastModified = "10-Oct-2004",
        lastModifiedBy = "Ashok Kumar",
        // Note array notation
        reviewers = { "AAA", "BBB", "CCC" })
class P042_MyAnnotationClass {
    // Class code goes here
}