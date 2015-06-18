package concepts;

/*
 * Description: Enums in Java
 * Note
 * 1. An enum type is a type whose fields consist of a fixed set of constants.
 * 2. Because they are constants, the names of an enum type's fields are in uppercase letters.
 * 3. Enums are like classes and can have their own methods and fields.
 * 4. toString(), Ordinal() and Values() are special methods added by Compiler for Enum Data Types.
 * 5. Enums can be used in Swtiches.
 * 6. All enums implicitly extend java.lang.Enum. Since Java does not support multiple inheritance, an enum cannot
 *    extend anything else.
 * 7. The constructor for an enum type must be package-private or private access. It automatically creates the
 *    constants that are defined at the beginning of the enum body. You cannot invoke an enum constructor yourself.
 */

public class P038_Classes_Enums {

    public enum WEEKDAYS {

        SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY
    };

    public static void main(String args[]) {

        // Declaring and Assigning an enum
        WEEKDAYS weekday = WEEKDAYS.MONDAY;

        System.out.println("Enums in switch Case");
        switch (weekday) {
        case SUNDAY:
            System.out.println(weekday + " Ordinal:" + weekday.ordinal());
            break;
        case MONDAY:
            System.out.println(weekday + " Ordinal:" + weekday.ordinal());
            break;
        case TUESDAY:
            System.out.println(weekday + " Ordinal:" + weekday.ordinal());
            break;
        default:
            System.out.println(weekday + " Ordinal:" + weekday.ordinal());
            break;
        }

        // Enums can be used in foreach by using values() and ordinal() methods
        System.out.println("Enums in for each");
        for (WEEKDAYS w : WEEKDAYS.values()) {
            System.out.println(w + " Ordinal:" + w.ordinal());
        }
    }
}