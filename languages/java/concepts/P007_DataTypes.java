package concepts;

/*
 * Description: Primitive Data Types in Java
 * Note
 * 1. All 8 primitive data types are numeric types.
 * 2. Theoretically, integers have no decimal point, and floating point types do. But in main memory,
 *    there are no decimal points; even floating point values are represented with bit patterns.
 */
public class P007_DataTypes {

    public static void main(String args[]) {

        // Primitive Data Types set to their default values
        char value1 = '\u0000';         // char is 16-bit Unicode character which can have a minimum value of
                                        // '\u0000' (or 0) and a maximum value of '\uffff' (or 65,535 inclusive).

        boolean value2 = false;         // Java does not allows number as boolean as it is allowed in C/C++.

        byte value3 = 0;                // 8 bits signed two's complement integer. From -128 to +127
        short value4 = 0;               // 16 bits signed two's complement integer. From -32,768 to +32,767
        int value5 = 0;                 // 32 bits signed two's complement integer. From -2,147,483,648 to 2,147,483,647
        long value6 = 0;                // 64 bits signed two's complement integer. From -9,223,372,036,854,775,808 to
                                        // 9,223,372,036,854,775,807
        // long value7 = 1234_5678L;    // From Java SE 7 and later, any number of underscore characters (_) can appear
                                        // anywhere BETWEEN DIGITS in a numerical literal for better readability.

        float value8 = 0f;              // 32 bits -3.4E+38 to +3.4E+38
        double value9 = 0d;             // 64 bits -1.7E+308 to 1.7E+308

        // Decimal, Octal and Hexadecimal
        int decimalValue = 26;          // The number 26, in decimal
        int hexadecimalValue = 0x1a;    // The number 26, in hexadecimal
        // int binaryValue = 0b11010;   // The number 26, in binary. From Java SE 7 onwards

        // Print values
        System.out.println("value1 is: " + value1);
        System.out.println("value2 is: " + value2);
        System.out.println("value3 is: " + value3);
        System.out.println("value4 is: " + value4);
        System.out.println("value5 is: " + value5);
        System.out.println("value6 is: " + value6);
        System.out.println("value7 is: " + value8);
        System.out.println("value8 is: " + value9);

        System.out.println("decimalValue is: " + decimalValue);
        System.out.println("hexadecimalValue is: " + hexadecimalValue);
    }
}