# Description: The rename Verb in dplyr Package

library(dplyr)
library(ggplot2)

# Note
# 1. The rename verb is used to rename some of the columns.
# 2. Thoush the select vern can also be used to rename columns but it does not return all the columns.

# Variables can be renamed with select() by using named arguments.
sleepData <- select(msleep, Name = name, Sleep = sleep_total)

# Because select() drops all the variables not explicitly mentioned, it’s not that useful. Instead, use rename() to get
# all the columns with some of the columns renamed.
sleepData <- select(msleep, Name = name, Sleep = sleep_total)

# TODO
# 1. None
