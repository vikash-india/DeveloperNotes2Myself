# Custom settings for the Python logger
LOG_SETTINGS = {
    'version': 1,
    'formatters': {
        'verbose': {
            'format': '%(levelname)-8s\t%(process)d\t%(thread)d\t%(asctime)s\t%(module)s\t%(lineno)d\t%(funcName)s\t%(message)s'
        },
        # Define more formatters here
    },
    'handlers': {
        'file': {
            'level': 'INFO',
            'filename': 'application.log',
            'formatter': 'verbose',
            'class': 'logging.handlers.TimedRotatingFileHandler',
            'when': 'midnight'
        },
        'console': {
            'level': 'DEBUG',
            'formatter': 'verbose',
            'class': 'logging.StreamHandler',
            'level': 'INFO',
        },
        # Define more handlers here
    },
    'loggers': {
        'extensive': {
            # Effective level = extensive.level && handlers.file.level
            'level': 'DEBUG',
            'handlers': ['file', 'console']
        },
        # Define more loggers here
    }
}
