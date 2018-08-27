# Description: Reads a config file, stores values in a dictionary of dictionary and serves request

from ConfigParser import SafeConfigParser


class ConfigManager():
    """Reads a config file, stores in a dictionary of dictionary and serves request"""

    def read(self, fileName):
        """Reads the config file fileName and stores in a dictionary"""

        config = SafeConfigParser()
        config.read(fileName)

        self._dictionary = {}
        for section in config.sections():
            self._dictionary[section] = {}
            for option in config.options(section):
                self._dictionary[section][option] = config.get(section, option)

    def get(self, section, propertyKey):
        """Returns a property value if present, None otherwise"""

        propertyValue = None
        if (section in self._dictionary and propertyKey in self._dictionary[section]):
            propertyValue = self._dictionary[section][propertyKey]
        return propertyValue
