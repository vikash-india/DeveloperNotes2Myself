import logging
import random
import time

def lognow():
    """ A sample logging application """

    logger = logging.getLogger('extensive')

    for i in range(1,11):
        logType = random.randint(1, 5)

        if logType == 1:
            logger.debug("This is iteration {0}".format(i))
        elif logType == 2:
            logger.info("This is iteration {0}".format(i))
        elif logType == 3:
            logger.warn("This is iteration {0}".format(i))
        elif logType == 4:
            logger.error("This is iteration {0}".format(i))
        elif logType == 5:
            logger.critical("This is iteration {0}".format(i))

        time.sleep( 2 )
