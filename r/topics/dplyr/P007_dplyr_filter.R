# Description: The filter Verb in dplyr Package

library(dplyr)
library(ggplot2)

# Note
# 1. The filter() verb is used to select a subset of rows in a data frame.
# 2. The first argument is the name of the data frame. The second and subsequent arguments are the expressions that
#    filter the data frame.
# 3. The filter() works similarly to subset() except that you can give it any number of filtering conditions, which are
#    joined together with & (not && which is easy to do accidentally!)

# Filter the rows for mammals that sleep a total of more than 16 hours.
filter(msleep, sleep_total >= 16)

# Filter the rows for mammals that sleep a total of more than 16 hours and have a body weight of greater than 1 kilogram.
filter(msleep, sleep_total >= 16, bodywt >= 1)

# Filter the rows for mammals in the Perissodactyla and Primates taxonomic order
# Note: You can use the boolean operators (e.g. >, <, >=, <=, !=, %in%) to create the logical tests.
filter(msleep, order %in% c("Perissodactyla", "Primates"))

# TODO
# 1. None
