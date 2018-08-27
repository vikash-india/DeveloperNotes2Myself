package topics.testng;

import static org.testng.AssertJUnit.assertEquals;

import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

public class SimpleInterestComputerTests {

    @BeforeClass
    public void oneTimeSetUp() {
        // One-time initialisation code goes here
        System.out.println("@BeforeClass - oneTimeSetUp - Executing One-time initialisation code.");
    }

    @AfterClass
    public void oneTimeTearDown() {
        // One-time clean up code goes here
        System.out.println("@AfterClass - oneTimeTearDown - Executing one-time clean up code.");
    }

    @BeforeMethod
    public void setUp() {
        // Initialisation code before each test case code goes here
        System.out.println("@BeforeMethod - setUp - Executing test case initialisation code.");
    }

    @AfterMethod
    public void tearDown() {
        // Clean up code after each test case code goes here
        System.out.println("@AfterMethod - tearDown - Executing test case clean up code.");
    }

    @Test
    public void testComputeInterestIfMethodReturnsProperInterest() {
        System.out.println("@Test - testComputeIfMethodReturnsProperInterest - Executing test case.");

        SimpleInterestComputer simpleInterestComputer = new SimpleInterestComputer();

        double principal = 5000d;
        double tenureInYears = 2d;
        double rateInPercent = 10d;
        double interest = simpleInterestComputer.computeInterest(principal, tenureInYears, rateInPercent);

        double expectedInterest = 1000d;

        assertEquals(expectedInterest, interest, 0.01);
    }

    @Test
    public void testComputeInterestIfMethodReturnsProperInterestWhenPrincipalIsNegative() {
        System.out
                .println("@Test - testComputeIfMethodReturnsProperInterestWhenTenureIsNegative - Executing test case.");

        double principal = -5000d;
        double tenureInYears = 2d;
        double rateInPercent = 10d;

        SimpleInterestComputer simpleInterestComputer = new SimpleInterestComputer();
        double interest = simpleInterestComputer.computeInterest(principal, tenureInYears, rateInPercent);

        double expectedInterest = 0d;

        assertEquals(expectedInterest, interest, 0.01);
    }

    @Test
    public void testComputeIfMethodReturnsProperInterestWhenTenureIsNegative() {
        System.out
                .println("@Test - testComputeIfMethodReturnsProperInterestWhenTenureIsNegative - Executing test case.");

        double principal = 5000d;
        double tenureInYears = -2d;
        double rateInPercent = 10d;

        SimpleInterestComputer simpleInterestComputer = new SimpleInterestComputer();
        double interest = simpleInterestComputer.computeInterest(principal, tenureInYears, rateInPercent);

        double expectedInterest = 0d;

        assertEquals(expectedInterest, interest, 0.01);
    }

    @Test
    public void testComputeIfMethodReturnsProperInterestWhenRateIsNegative() {
        System.out.println("@Test - testComputeIfMethodReturnsProperInterestWhenRateIsNegative - Executing test case.");

        double principal = 5000d;
        double tenureInYears = 2d;
        double rateInPercent = -10d;

        SimpleInterestComputer simpleInterestComputer = new SimpleInterestComputer();
        double interest = simpleInterestComputer.computeInterest(principal, tenureInYears, rateInPercent);

        double expectedInterest = 0d;

        assertEquals(expectedInterest, interest, 0.01);
    }
}