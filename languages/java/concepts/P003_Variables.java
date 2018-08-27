package concepts;

/*
 * Description: Variables in Java
 * Note
 * 1. Different types of variables
 *      - Instance Variables (Non-Static Fields)
 *      - Class Variables (Static Fields)
 *      - Local Variables (Inside a Method)
 *      - Parameters (Function Parameters)
 */
public class P003_Variables {

    public static void main(String[] args) {

        // Naming of variables
        int variableNamesAreCaseSensitive = 1;
        int VARIABLENAMESARECASESENSITIVE = 2;
        int variablesCanStartWithAlphabets = 3;
        int $variablesCanStartWithDollarSign = 4;
        int _variablesCanStartWithUnderscore = 5;
        int _variablesCanBeOfAnyLengthUnicodeLettersAndDigits = 6;
        int SubsequentCharactersMayBeLettersDigits0to9OrDollarSign$OrUnderscore_ = 7;

        // Print values
        System.out.println(variableNamesAreCaseSensitive);
        System.out.println(VARIABLENAMESARECASESENSITIVE);
        System.out.println(variablesCanStartWithAlphabets);
        System.out.println($variablesCanStartWithDollarSign);
        System.out.println(_variablesCanStartWithUnderscore);
        System.out.println(_variablesCanBeOfAnyLengthUnicodeLettersAndDigits);
        System.out.println(SubsequentCharactersMayBeLettersDigits0to9OrDollarSign$OrUnderscore_);
    }
}