package concepts;

/*
 * Description: Access Specifiers in Packages
 * Note
 * 1. Class Member Access Chart
 *      Description                     Private         No modifier     Protected       Public
 *      --------------------------------------------------------------------------------------
 *	Same class			Yes	        Yes		Yes	       Yes
 *	Same package subclass	        No		Yes		Yes	       Yes
 *	Same package non-subclass	No		Yes		Yes	       Yes
 *	Different package subclass	No		No		Yes	       Yes
 *	Different package non-subclass	No		No		No	       Yes
 */

public class P070_Packages_AccessSpecifiers {

    public static void main(String args[]) {

        System.out.println("Read the notes here.");
    }
}