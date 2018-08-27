# Description: Application config manager - A class that needs to be tested.

import ConfigParser


class ConfigManager():
    """Reads a config file and creates a dictionary and then serves all request"""

    def read(self, fileName):
        """Reads the config file fileName and stores in a dictionary"""
        config = ConfigParser.ConfigParser()
        config.read(fileName)

        self._dictionary = {}
        for section in config.sections():
            self._dictionary[section] = {}
            for option in config.options(section):
                self._dictionary[section][option] = config.get(section, option)

    def getPropertyValue(self, section, propertyKey):
        """Returns a property value if present, None otherwise"""
        propertyValue = None
        if (section in self._dictionary and propertyKey in self._dictionary[section]):
            propertyValue = self._dictionary[section][propertyKey]
        return propertyValue
