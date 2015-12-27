# Description: The datatime.date Class

import time
from datetime import date

"""
The datetime.date object:
* A date object represents a date (year, month and day) in the current Gregorian calendar calendar.
* The attributes of the datetime.date object are year, month, and day.
"""

# Constructor
# 1. All arguments are REQUIRED.
# 2. Arguments may be ints or longs.
# 3. The value of various parameters are as follows
#       - MINYEAR <= year <= MAXYEAR
#       - 1 <= month <= 12
#       - 1 <= day <= number of days in the given month and year
print "Constructor"
print date(year=2015, month=12, day=25)

# Class Methods
print "\nClass Methods"
print date.today()                      # Return the current local date. Equivalent to date.fromtimestamp(time.time()).
print date.fromtimestamp(time.time())   # Return the local date corresponding to the POSIX timestamp.
                                        # NOTE: It needs built-in time module instead of datetime.time.
print date.fromordinal(1)               # January 1 of year 1 is day number 1, January 2 of year 1 is day number 2 etc.

# Class Attributes
print "\nClass Attributes"
print date.min                              # The earliest representable date, date(MINYEAR, 1, 1).
print date.max                              # The latest representable date, date(MAXYEAR, 12, 31).
print date.resolution                       # The smallest possible difference between date objects, timedelta(days=1).
print date.year                             # Between MINYEAR and MAXYEAR inclusive.
print date.month                            # Between 1 and 12 inclusive.
print date.day                              # Between 1 and the number of days in the given month of the given year.

# Instance Methods
print "\nInstance Methods"
print date.today().replace(year=2012, month=2, day=23)  # Return a date after replacing the portion with parameters.
print date.today().timetuple().tm_year      # Return a time.struct_time whose values can be accessed by index and by
                                            # attribute name. The attributes names are
"""
                                            # +-------+-----------+---------------------------+
                                            # | Index | Attribute |        Description        |
                                            # +-------+-----------+---------------------------+
                                            # |     0 | tm_year   | (for example, 1993)       |
                                            # |     1 | tm_mon    | range [1, 12]             |
                                            # |     2 | tm_mday   | range [1, 31]             |
                                            # |     3 | tm_hour   | range [0, 23]             |
                                            # |     4 | tm_min    | range [0, 59]             |
                                            # |     5 | tm_sec    | range [0, 61];            |
                                            # |     6 | tm_wday   | range [0, 6], Monday is 0 |
                                            # |     7 | tm_yday   | range [1, 366]            |
                                            # |     8 | tm_isdst  | 0, 1 or -1;               |
                                            # +-------+-----------+---------------------------+
"""
print date.today().toordinal()              # Return the Gregorian ordinal, where January 1 of year 1 has ordinal 1.
print date.today().weekday()                # Return the day of the week as an integer, where Monday = 0 and Sunday = 6.
print date.today().isoweekday()             # Return the day of the week as an integer, where Monday = 1 and Sunday = 7.
print date.today().isocalendar()            # Return a 3-tuple, (ISO year, ISO week number, ISO weekday).
print date.today().isoformat()              # Return a string representing the date in ISO 8601 format, 'YYYY-MM-DD'.
print date.today().__str__()                # For a date d, str(d) is equivalent to d.isoformat().
print date.today().ctime()                  # date(2002, 12, 4).ctime() == 'Wed Dec 4 00:00:00 2002'.
                                            # date.ctime() is equivalent to time.ctime(time.mktime(d.timetuple()))
print date.today().strftime("%d-%m-%Y")     # Format date
print date.today().__format__("%d-%m-%Y")   # Same as date.strftime("%d-%m-%Y")
