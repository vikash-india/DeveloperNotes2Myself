# Description: The datatime.time Class

from datetime import time
from datetime import datetime

"""
The datetime.time Object:
* An idealized time, independent of any particular day, assumes that every day has exactly 24*60*60 seconds. There is
  no notion of 'leap seconds'.
* Attributes of the datetime.time object are hour, minute, second, microsecond, and tzinfo.
"""

# Constructor
# 1. All arguments are OPTIONAL.
# 2. Arguments may be ints or longs.
# 3. The argument tzinfo may be None, or an instance of a tzinfo subclass.
# 4. The value of various parameters are as follows
#       0 <= hour < 24
#       0 <= minute < 60
#       0 <= second < 60
#       0 <= microsecond < 1000000.
print "Constructor"
print time(hour=14, minute=2, second=34, microsecond=454, tzinfo=None)

# Class Attributes
print "\nClass Attributes"
print time.min                      # The earliest representable time ie time(0, 0, 0, 0).
print time.max                      # The latest representable time, time(23, 59, 59, 999999).
print time.resolution               # The smallest possible difference between non-equal time objects,
                                    # timedelta(microseconds=1). Note that arithmetic on time objects is not supported.
                                    # Instance attributes (read-only):
print time.hour                     # In range(24).
print time.minute                   # In range(60).
print time.second                   # In range(60).
print time.microsecond              # In range(1000000).
print time.tzinfo                   # If tzinfo is None, returns None, else returns the tzinfo object passed.

# Instance Methods
print "\nInstance Methods"
now = datetime.now().time()
print now.replace(hour=11, minute=12, second=13, microsecond=14, tzinfo=None) # Replace & return.
print time.isoformat(now)           # Return a string representing the time in ISO 8601 format, HH:MM:SS.mmmmmm.
print time.__str__(now)             # For a time t, str(t) is equivalent to t.isoformat().
print now.strftime("%d-%m-%Y")      # Return a string representing the time, controlled by an explicit format string.
print now.__format__("%d-%m-%Y")    # Same as time.strftime().
print time.utcoffset(now)           # If tzinfo is None, returns None, else returns self.tzinfo.utcoffset(None).
print time.dst(now)                 # If tzinfo is None, returns None, else returns self.tzinfo.dst(None).
print time.tzname(now)              # If tzinfo is None, returns None, else returns self.tzinfo.tzname(None).
