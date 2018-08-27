from Logger import initialise
from Producer_1 import lognow as lognow1
from Producer_2 import lognow as lognow2

# This should be done only once for the application
initialise()

# The application execution proceeds as usual
lognow1()
lognow2()