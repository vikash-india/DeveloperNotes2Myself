# Description: The group_by Function in dplyr Package

library(dplyr)
library(ggplot2)

# Note
# 1. The group_by is related to the concept of "split-apply-combine". Split the data frame by some variable (eg.
#    taxonomic order), apply a function to the individual data frames and then combine the output.
# 2. Grouping affects the verbs as follows
#    - The grouped select() is the same as ungrouped select(), except that grouping variables are always retained.
#    - grouped arrange() orders first by the grouping variables.
#    - mutate() and filter() are most useful in conjunction with window functions (like rank(), or min(x) == x).
#    - sample_n() and sample_frac() sample the specified number/fraction of rows in each group.
#    - slice() extracts rows within each group.
#    - summarise() is powerful and easy to understand, as described in more detail below.

# Split the msleep data frame by the taxonomic order, then create some summary statistics. Lets get a set of summary
# statistics for each taxonomic order.
msleep %>%
    group_by(order) %>%
    summarise(avg_sleep = mean(sleep_total),
              min_sleep = min(sleep_total),
              max_sleep = max(sleep_total),
              total = n())

# TODO
# 1. None
