import unittest

from SimpleInterest import computeSimpleInterest


class SimpleInterestTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        """Runs once for this Class"""
        print "Running setUpClass"

    def setUp(self):
        """Runs before every test case"""
        print "Running setUp"

    def tearDown(self):
        """Runs after every test case"""
        print "Running tearDown"

    def test_if_interest_is_zero_when_principal_is_zero(self):
        interest = computeSimpleInterest(0, 10, 0)
        self.assertEqual(interest, 0, "Interest is not 0 even if principal is 0!")

    def test_if_interest_is_zero_when_time_is_negative(self):
        interest = computeSimpleInterest(100, 10, -10)
        self.assertEqual(interest, 0, "Interest is not 0 even if time is negative!")

    def test_if_interest_is_zero_when_rate_is_negative(self):
        interest = computeSimpleInterest(100, -10, 10)
        self.assertEqual(interest, 0, "Interest is not 0 even if rate is negative!")


# Way 1: Detect and Run all test cases
# Note: The order in which the various test cases will be run is determined by sorting the test function names
# with respect to the built-in ordering for strings.
suite = unittest.TestLoader().loadTestsFromTestCase(SimpleInterestTests)
unittest.TextTestRunner(verbosity=2).run(suite)

# Way 2: Run test cases in a specific order
# def suite():
#     suite = unittest.TestSuite()
#     suite.addTest(TestSimpleInterest('test_if_interest_is_zero_when_principal_is_zero'))
#     suite.addTest(TestSimpleInterest('test_if_interest_is_zero_when_time_is_negative'))
#     suite.addTest(TestSimpleInterest('test_if_interest_is_zero_when_rate_is_negative'))
#     return suite
#
# testSuite = suite()
# unittest.TextTestRunner(verbosity = 2).run(testSuite)
