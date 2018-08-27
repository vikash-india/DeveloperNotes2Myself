package concepts;

/*
 * Description: Switch Case Control Construct in Java
 * Note
 * 1. The continue keyword is used in a loop and should not be used in a switch case.
 * 2. Duplicate case labels are not allowed.
 */
public class P008_ControlConstruct_SwitchCase {

    public static void main(String args[]) {

        int i = 3;
        switch (i) {
        case 1:
            System.out.println("1");
            break;
        case 2:
            System.out.println("2");
            break;
        case 3:
        case 4:
            System.out.println("3 or 4");
            break;
        default:
            System.out.println("Default");
        }

//        // From Java SE 7 and later, String object in the switch statement's expression is supported
//        int dayNumber = 0;
//        String day = "Wednesday";
//        switch (day.toLowerCase()) {
//        case "sunday":
//            dayNumber = 1;
//            break;
//        case "monday":
//            dayNumber = 2;
//            break;
//        case "tuesday":
//            dayNumber = 3;
//            break;
//        case "wednesday":
//            dayNumber = 4;
//            break;
//        case "thursday":
//            dayNumber = 5;
//            break;
//        case "friday":
//            dayNumber = 6;
//            break;
//        case "saturday":
//            dayNumber = 7;
//            break;
//        default:
//            dayNumber = 0;
//            break;
//        }
    }
}
