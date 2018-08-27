package topics.testng;

public class SimpleInterestComputer {

    public double computeInterest(double principal, double tenureInYears, double rateInPercent) {
        double simpleInterest = 0d;

        if(validateInputs(principal, tenureInYears, rateInPercent, simpleInterest)) {
            simpleInterest = principal * tenureInYears * rateInPercent / 100;
        }

        return simpleInterest;
    }

    private boolean validateInputs(double principal, double tenureInYears, double rateInPercent, double simpleInterest) {
        boolean success = true;

        if (tenureInYears <= 0)
            return false;

        if (principal <= 0)
            return false;

        if (rateInPercent <= 0)
            return false;

        return success;
    }

    public static void main(String[] args) {

        double principal = 5000d;
        double tenureInYears = 2d;
        double rateInPercent = 10d;

        SimpleInterestComputer simpleInterestComputer = new SimpleInterestComputer();
        double interest = simpleInterestComputer.computeInterest(principal, tenureInYears, rateInPercent);

        System.out.println("Interest = " + interest);
    }
}
