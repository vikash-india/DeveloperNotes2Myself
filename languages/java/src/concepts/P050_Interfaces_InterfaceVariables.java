package concepts;

/*
 * Description: Interfaces Variables in Java
 * Note
 * 1. You can use interfaces to import shared constants into multiple classes by simply declaring an interface that
 *    contains variables which are initialised to the desired values. When you include that interface in a class (that
 *    is, when you "implement" the interface), all of those variable names will be in scope as constants. This is
 *    similar to using a header file in C/C++ to create a large number of #defined constants or const declarations.
 * 2. If an interface contains no methods, then any class that includes such an interface doesn't actually implement
 *    anything. It is as if that class were importing the constant variables into the class name space as final
 *    variables.
 */
public class P050_Interfaces_InterfaceVariables {

    public static void main(String args[]) {
        P050_CarDelivery carDelivery = new P050_CarDelivery();

        carDelivery.getCarDeliveryDetails(carDelivery.getCarDeliveryCode(20));
        carDelivery.getCarDeliveryDetails(carDelivery.getCarDeliveryCode(50));
        carDelivery.getCarDeliveryDetails(carDelivery.getCarDeliveryCode(70));
        carDelivery.getCarDeliveryDetails(carDelivery.getCarDeliveryCode(97));
        carDelivery.getCarDeliveryDetails(carDelivery.getCarDeliveryCode(99));
    }
}

interface P050_CarDeliveryInterface {
    // Interface variables
    int NO = 0;
    int YES = 1;
    int MAYBE = 2;
    int LATER = 3;
    int SOON = 4;
    int NEVER = 5;

    public int getCarDeliveryCode(int probability);
}

class P050_CarDelivery implements P050_CarDeliveryInterface {

    public int getCarDeliveryCode(int probability) {
        if (probability < 30)
            return NO; // 30%
        else if (probability < 60)
            return YES; // 30%
        else if (probability < 75)
            return LATER; // 15%
        else if (probability < 98)
            return SOON; // 13%
        else
            return NEVER; // 2%
    }

    public void getCarDeliveryDetails(int result) {
        switch (result) {
        case NO:
            System.out.println("No");
            break;
        case YES:
            System.out.println("Yes");
            break;
        case MAYBE:
            System.out.println("Maybe");
            break;
        case LATER:
            System.out.println("Later");
            break;
        case SOON:
            System.out.println("Soon");
            break;
        case NEVER:
            System.out.println("Never");
            break;
        }
    }
}