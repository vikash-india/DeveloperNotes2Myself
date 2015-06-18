package concepts;

/*
 * Description: A complete enum example in Java
 * Note
 * 1. Enums are like classes and can have their own methods and fields.
 * 2. toString(), Ordinal() and Values() are special methods added by Compiler for Enum Data Types.
 * 3. Enums can be used in Switches.
 * 4. All enums implicitly extend java.lang.Enum. Since Java does not support multiple inheritance, an enum cannot
 *    extend anything else.
 * 5. The constructor for an enum type must be package-private or private access. It automatically creates the constants
 *    that are defined at the beginning of the enum body. You cannot invoke an enum constructor yourself.
 */

public class P039_Classes_Enums_Example {

    public static void main(String[] args) {

        // Using an Enum
        P039_WEEKDAY weekday = P039_WEEKDAY.MONDAY;
        String displayString = weekday.getDisplayString();
        System.out.println("Weekday: " + displayString);

        // Getting Type of "CONTRIBUTION"
        P039_WEEKDAY weekdayNew = P039_WEEKDAY.getXnType(4);
        String displayStringNew = weekdayNew.getDisplayString();
        System.out.println("WeekdayNew: " + displayStringNew);

        // Getting Numeric Code if the method is public
        // int numericCode = weekdayNew.getNumericCode();

    }
}

enum P039_WEEKDAY {
    SUNDAY(1, "Sunday"),
    MONDAY(2, "Monday"),
    TUESDAY(3, "Tuesday"),
    WEDNESDAY(4, "Wednesday"),
    THURSDAY(5, "Thursday"),
    FRIDAY(6, "Friday"),
    SATURDAY(7, "Saturday");

    public static P039_WEEKDAY getXnType(int numericCode) {
        for (P039_WEEKDAY weekday : P039_WEEKDAY.values()) {
            if (weekday.getNumericCode() == numericCode)
                return weekday;
        }
        return null;
    }

    private final int numericCode;
    private final String uiDisplayString;

    private P039_WEEKDAY(int numericCode, String uiDisplayString) {
        this.numericCode = numericCode;
        this.uiDisplayString = uiDisplayString;
    }

    public String getDisplayString() {
        return uiDisplayString;
    }

    private int getNumericCode() {
        return numericCode;
    }
}