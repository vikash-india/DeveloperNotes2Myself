package concepts;

/*
 * Description: Relational Operators in Java
 */

public class P022_Operators_Relational {

    public static void main(String args[]) {
        int i = 12;
        int j = 24;
        boolean result = false;

        result = (i == j);                      // == for equal to
        result = (i != j);                      // != for not equal to
        result = (i > j);                       // > for greater than
        result = (i < j);                       // < for less than
        result = (i <= j);                      // <= for less than or equal to
        result = (i >= j);                      // >= for greater than or equal to

        System.out.println(result);
    }
}