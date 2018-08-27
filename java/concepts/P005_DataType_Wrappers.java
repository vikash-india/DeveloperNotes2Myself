package concepts;

/*
 * Description: Wrapper Class for 8 Primitive Data Types
 * Note
 * 1. For each primitive data type, there is a corresponding wrapper class.
 * 2. A wrapper class can be used to convert a primitive data value into an object, and some type of objects into
 *    primitive data.
 */
public class P005_DataType_Wrappers {

    public static void main(String args[]) {

        Character value1 = 'A';                 // Wrapper class for char
        Boolean value2 = true;                  // Wrapper class for boolean

        Byte value3 = Byte.MAX_VALUE;           // Wrapper class for byte
        Short value4 = Short.MAX_VALUE;         // Wrapper class for short

        Integer value5 = Integer.MAX_VALUE;     // Wrapper class for int
        Long value6 = Long.MAX_VALUE;           // Wrapper class for long
        Float value7 = Float.MAX_VALUE;         // Wrapper class for float
        Double value8 = Double.MAX_VALUE;       // Wrapper class for double

        // Print values
        System.out.println(value1);
        System.out.println(value2);
        System.out.println(value3);
        System.out.println(value4);
        System.out.println(value5);
        System.out.println(value6);
        System.out.println(value7);
        System.out.println(value8);
    }
}