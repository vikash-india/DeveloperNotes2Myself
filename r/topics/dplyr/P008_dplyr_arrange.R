# Description: The arrange Verb in dplyr Package

library(dplyr)
library(ggplot2)

# Note
# 1. The arrange() verb works similarly to filter() except that instead of filtering or selecting rows, it reorders them.
# 2. It takes a data frame, and a set of column names (or more complicated expressions) to order by.
# 3. If you provide more than one column name, each additional column will be used to break ties in the values of
#    preceding columns:

# The arrange verb is used to arrange (or re-order) rows by a particular column such as the taxonomic order
msleep %>% arrange(order) %>% head

# Select three columns from msleep, arrange the rows by the taxonomic order and then arrange the rows by sleep_total.
# Finally show the head of the final data frame
msleep %>%
    select(name, order, sleep_total) %>%
    arrange(order, sleep_total) %>%
    head

# Same as above, except here we filter the rows for mammals that sleep for 16 or more hours instead of showing the head
# of the final data frame
msleep %>%
    select(name, order, sleep_total) %>%
    arrange(order, sleep_total) %>%
    filter(sleep_total >= 16)

# Same as above, except arrange the rows in the sleep_total column in a descending order using the function desc().
msleep %>%
    select(name, order, sleep_total) %>%
    arrange(order, desc(sleep_total)) %>%
    filter(sleep_total >= 16)

# TODO
# 1. None
