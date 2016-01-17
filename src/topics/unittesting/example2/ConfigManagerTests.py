from ConfigManager import ConfigManager
import unittest

class ConfigManagerTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        """Runs once for this Class"""

    def setUp(self):
        """Runs before every test case"""

        self.configManager = ConfigManager()
        self.configManager.read("application.config")

    def tearDown(self):
        """Runs after every test case"""
        self.configManager = None

    def test_if_config_file_has_content(self):
        self.assertNotEqual(len(self.configManager._dictionary), 0, "Config file content could not be loaded")

    def test_if_value_is_returned_for_an_existing_property(self):
        self.assertEqual(self.configManager.getPropertyValue("log", "log_file_name"), "application.log")

    def test_if_None_is_returned_for_a_non_existing_property(self):
        self.assertEqual(self.configManager.getPropertyValue("log", "non_existing_key"), None)

    def test_if_None_is_returned_for_a_non_existing_section(self):
        self.assertEqual(self.configManager.getPropertyValue("non_existing_section", "log_file_name"), None)

    @unittest.skip("Non Existent Section and Key. A sub test")
    def test_if_None_is_returned_for_a_non_existing_section_and_property(self):
        self.assertEqual(self.configManager.getPropertyValue("non_existing_section", "non_existing_key"), None)

# Detect and Run all test cases
# Note: The order in which the various test cases will be run is determined by sorting the test function names
# with respect to the built-in ordering for strings.
suite = unittest.TestLoader().loadTestsFromTestCase(ConfigManagerTests)
unittest.TextTestRunner(verbosity = 2).run(suite)

# Run test cases in a specific order
# def suite():
#     suite = unittest.TestSuite()
#     suite.addTest(ConfigManagerTests('test_if_value_is_returned_for_an_existing_property'))
#     suite.addTest(ConfigManagerTests('test_if_None_is_returned_for_a_non_existing_section'))
#     suite.addTest(ConfigManagerTests('test_if_None_is_returned_for_a_non_existing_property'))
#     return suite
#
# testSuite = suite()
# unittest.TextTestRunner(verbosity = 2).run(testSuite)
