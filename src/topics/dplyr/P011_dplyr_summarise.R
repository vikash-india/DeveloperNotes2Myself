# Description: The summarise Verb in dplyr Package

library(dplyr)
library(ggplot2)

# Note
# 1. The summarise() function creates summary statistics for a given column in the data frame such as finding the mean.
# 2. It collapses a data frame to a single row and this is exactly equivalent to plyr::summarise().
# 3. There are many summary statistics such as mean(), sd(), min(), max(), median(), sum(), n() (returns the length of
#    vector), first() (returns first value in vector), last() (returns last value in vector) and n_distinct() (number of
#    distinct values in vector), IQR()

# Compute the average number of hours of sleep, apply the mean() function to the column sleep_total and call the summary
# value avg_sleep.
msleep %>%
    summarise(avg_sleep = mean(sleep_total))

# Use multiple functions
msleep %>%
    summarise(avg_sleep = mean(sleep_total),
              min_sleep = min(sleep_total),
              max_sleep = max(sleep_total),
              total = n())
# TODO
# 1. None
