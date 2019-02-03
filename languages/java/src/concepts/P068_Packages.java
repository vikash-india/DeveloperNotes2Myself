package concepts; // Definition of a package

/*
 * Description: Packages in Java
 * Note
 * 1. A package is a grouping of related types providing access protection and name space management. Types refers to
 *    classes, interfaces, enumerations, and annotation types.
 * 2. Why Packages
 *      - Easier to Manage: It is easier to determine the types are related.
 *      - Bundle Groups Together: It is easier to find types that can provide similar functions.
 *      - Avoid Name Conflicts: The names of one types won't conflict with the type names in other packages because the
 *        package creates a new namespace.
 *      - Control Access: Types within a package can have unrestricted access to one another yet still restrict access
 *        for types outside the package.
 * 3. Creating a Package
 *      - Put a package statement with that name at the top of every source file that contains the types (classes,
 *        interfaces, enumerations, and annotation types).
 *      - If you put multiple types in a single source file, only one can be public, and it must have the same name as
 *        the source file.
 *      - If you do not use a package statement, your type ends up in an unnamed package. Generally an unnamed package
 *        is only for small or temporary applications or when you are just beginning the development process. Otherwise,
 *        classes and interfaces belong in named packages.
 * 4. Naming a Package
 *      - Package names are written in all lower case to avoid conflict with the names of classes or interfaces.
 *      - Companies use their reversed Internet domain name to begin their package names. For example,
 *        com.example.mypackage for a package named mypackage created by a programmer at example.com.
 *      - Name collisions that occur within a single company need to be handled by convention within that company,
 *        perhaps by including the region or the project name after the company name (for example,
 *        com.example.region.mypackage).
 *      - Packages in the Java language itself begin with java. or javax.
 *      - In some cases, the internet domain name may not be a valid package name. This can occur if the domain name
 *        contains a hyphen or other special character, if the package name begins with a digit or other character that
 *        is illegal to use as the beginning of a Java name, or if the package name contains a reserved Java keyword,
 *        such as "int". In this event, the suggested convention is to add an underscore. For example:
 *                      hyphenated-name.example.org => org.example.hyphenated_name
 *                      example.int => int_.example
 *                      123name.example.com => com.example._123name
 * 5. Typically, a Java source file can contain any (or all) of the following 4 internal parts
 *      - A single package statement (optional)
 *	- Any number of import statements (optional)
 *	- A single public class declaration (required)
 *	- Any number of classes private to the package (optional)
 * 6. Using Package Members
 *      - Referring to a Package Member by Its Qualified Name. Example
 *              graphics.Rectangle myRect = new graphics.Rectangle();
 *      - Importing a Package Member. Example
 *              import graphics.Rectangle;
 *      - Importing an Entire Package. Example
 *              import graphics.*;
 *      - Static import statement: There are time when one needs frequent access to static final fields (constants) and
 *        static methods from one or two classes. Prefixing the name of these classes over and over can result in
 *        cluttered code. The static import statement gives a way to import the constants and static methods that one
 *        wants to use so that there is no need to prefix the name of their class. Exmaple
 *              public static final double PI  = 3.141592653589793; // Defined Math.PI
 *
 *              import static java.lang.Math.PI; // Import Individually
 *              import static java.lang.Math.*;  // Import as a group
 *              double r = cos(PI * theta);      // After Importing
 * 7. Name Ambiguities: If a member in one package shares its name with a member in another package and both packages are
 *    imported, you must refer to each member by its qualified name. Example
 *              furniture.Table t1;
 *              html.Table t2;
 * 8. Managing Source and Class Files
 *      - Put the source code for a class, interface, enumeration, or annotation type in a text file whose name is the
 *        simple name of the type and whose extension is .java.
 *      - Put the source file in a directory whose name reflects the name of the package to which the type belongs.
 * 9. Details about this class P234_Packages
 *      - The generated Class file should be kept in directory called "concepts".
 *      - The directory "concepts" should either be inside the current directory or it should be part of CLASSPATH.
 *	- The class file should be executed with java concepts.P234_Packages
 * 10. Hierarchical Packages can be created using package pkg1[.pkg2[.pkg3]]; and the file system should also reflect
 *     the directory structure.
 */
public class P068_Packages {
    public static void main(String args[]) {

        // TODO: Update this example
        P064_Balance current[] = new P064_Balance[3];

        current[0] = new P064_Balance("K. J. Fielding", 123.23);
        current[1] = new P064_Balance("Will Tell", 157.02);
        current[2] = new P064_Balance("Tom Jackson", -12.33);
        for (int i = 0; i < 3; i++)
            current[i].show();
    }
}

class P064_Balance {
    String name;
    double balance;

    P064_Balance(String n, double b) {
        name = n;
        balance = b;
    }

    void show() {
        if (balance < 0)
            System.out.print("--> ");
        System.out.println(name + ": $" + balance);
    }
}