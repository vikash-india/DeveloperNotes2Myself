package concepts;

/*
 * Description: Interfaces as Type in Java
 * Note
 * 1. TODO
 */
public class P051_Interfaces_InterfaceAsType {

    public static void main(String args[]) {
        CarOperations carOperations = new LamborghiniVenenoRoadster();
        carOperations.horn();
        carOperations.changeGear();
        carOperations.fillPetrol();
        carOperations.openWindow();
        // Error: Interface Reference cannot access class level methods
        // carOperations.startWithoutKey();

        carOperations = new PorscheSpyder();
        carOperations.horn();
        carOperations.changeGear();
        carOperations.fillPetrol();
        carOperations.openWindow();
    }
}

interface CarOperations {
    public void horn();

    public void changeGear();

    public void fillPetrol();

    public void openWindow();
}

class LamborghiniVenenoRoadster implements CarOperations {
    public void horn() {
        System.out.println("Lamborghini Veneno Roadster Horn");
    };

    public void changeGear() {
        System.out.println("Lamborghini Veneno Roadster changeGear");
    };

    public void fillPetrol() {
        System.out.println("Lamborghini Veneno Roadster fillPetrol");
    };

    public void openWindow() {
        System.out.println("Lamborghini Veneno Roadster OpenWindow");
    };

    // Other Methods
    public void startWithoutKey() {
        System.out.println("Lamborghini Veneno Roadster startWithoutKey");
    };
}

class PorscheSpyder implements CarOperations {
    public void horn() {
        System.out.println("Porsche 918 Spyder horn");
    };

    public void changeGear() {
        System.out.println("Porsche 918 Spyder changeGear");
    };

    public void fillPetrol() {
        System.out.println("Porsche 918 Spyder fillPetrol");
    };

    public void openWindow() {
        System.out.println("Porsche 918 Spyder openWindow");
    };
}