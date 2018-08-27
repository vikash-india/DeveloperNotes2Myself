# Description: The distinct Verb in dplyr Package

library(dplyr)
library(ggplot2)

# Note
# 1. The distinct() verb is used to find unique values in a table.
# 2. This is very similar to base::unique() but should be much faster.

# Distinct name
distinct(msleep, name)

# Distinct name and order combination
distinct(msleep, name, order)

# TODO
# 1. None
