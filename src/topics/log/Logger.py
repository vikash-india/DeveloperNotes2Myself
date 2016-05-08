from logging.config import dictConfig

# Custom settings for the logger
from LogSettings import LOG_SETTINGS

def initialise():
    """Initialize Logger"""
    dictConfig(LOG_SETTINGS)


