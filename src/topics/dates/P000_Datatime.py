# Description: The datatime Module

import datetime

"""
Datetime Module:
* The datetime module supplies classes for output formatting and manipulating dates and times.
* There are two kinds of date and time objects: naive and aware.
* Available Types and subclass relationship in datetime module is as follows
    object
        class datetime.timedelta
        class datetime.tzinfo
        class datetime.time
        class datetime.date
            class datetime.datetime
* Objects of these types are immutable.

Aware and Naive:
* Objects of the date type are always naive and always assumes the current Gregorian calendar.
* Objects of time type or datetime type may be naive or aware.
    - A datetime object d is aware if d.tzinfo is not None and d.tzinfo.utcoffset(d) does not return None.
    - A time object t is aware if t.tzinfo is not None and t.tzinfo.utcoffset(None) does not return None. Otherwise, t is naive.
    - If d.tzinfo is None, or if d.tzinfo is not None but d.tzinfo.utcoffset(d) returns None, d is naive.
* The distinction between naive and aware doesn't apply to timedelta objects.
"""

# Module Constants
print "Module Constants"
print datetime.MINYEAR  # Smallest year number allowed in a date or datetime object.
print datetime.MAXYEAR  # Largest year number allowed in a date or datetime object.
