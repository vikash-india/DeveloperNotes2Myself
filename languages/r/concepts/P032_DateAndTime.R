# Description: Date and Time in R

# Date in R
# 1. Dates are represented by the Date class.
# 2. Dates are stored internally as the number of days since 1970-01-01.
# 3. Dates can be coerced from a character string using the as.Date() function.
x <- as.Date("1970-01-01")
print(x)                            # [1] "1970-01-01"

unclass(x)                          # [1] 0. Internal storage as a number.
unclass(as.Date("1970-01-02"))      # [1] 1. Internal storage as a number.

# Time in R
# 1. Times are represented using the POSIXct or the POSIXlt class.
# 2. Times are stored internally as the number of seconds since 1970-01-01.
# 3. Times can be coerced from a character string using the as.POSIXlt or as.POSIXct function.
# 4. The POSIXct Class: POSIXct is just a very large integer internally. It uses a useful class to store times in
#    something like a data frame.
# 5. The POSIXlt Class: POSIXlt is a list internally and it stores a bunch of other useful information like the day of
#    the week, day of the year, month, day of the month.
x <- Sys.time()
print(x)                            # [1] "2014-04-24 22:04:14 IST"

unclass(x)                          # Internal storage as a number.
unclass(as.POSIXct(x))              # Internal storage as a number.
unclass(as.POSIXlt(x))              # Internal storage as a list.

p <- as.POSIXlt(x)                  # Using POSIXlt
print(x)                            # "2018-01-17 19:39:49 IST"
names(p)                            # [1] "sec" "min" "hour" "mday" "mon" "year" "wday" "yday" "isdst"
print(p$sec)                        # [1] 14.34

x <- Sys.time()                     # Using POSIXct
print(x)                            # "2013-01-24 22:04:14 EST". Already in ‘POSIXct’ format
names(x)                            # NULL.
print(x$sec)                        # Error: $ operator is invalid for atomic vectors

# Formatting String to Date and Time
# 1. Use strptime function to work with custom date string
# 2. Check ?strptime for details on format string.
datestring <- c("January 10, 2012 10:40", "December 9, 2011")
x <- strptime(datestring, "%B %d, %Y %H:%M")
print(x)                            # [1] "2012-01-10 10:40:00" "2011-12-09 09:10:00"
class(x)                            # [1] "POSIXlt" "POSIXt"

# Generic functions on date and time to extract a portion of date or time.
x <- as.Date("1970-01-01")
weekdays(x)                         # Gives the day of the week.
months(x)                           # Gives the month name.
quarters(x)                         # Gives the quarter number ('Q1', 'Q2', 'Q3', or 'Q4')

# Operations on Date and Time
# 1. Use mathematical operations + and - on dates and times.
# 2. Use comparison operators like ==, <=, etc.
# 3. These operators keep track of leap years, leap seconds, daylight savings, and time zones.
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x - y                               # Warning: Incompatible methods ("-.Date", "-.POSIXt") for "-".
                                    # Error: non-numeric argument to binary operator

x <- as.POSIXlt(x)
x - y                               # Time difference of 356.3 days


x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x - y                               # Time difference of 2 days. Takes care of leap year.

x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y - x                               # Time difference of 1 hours. Takes care of timezones.

# TODO
# * None
