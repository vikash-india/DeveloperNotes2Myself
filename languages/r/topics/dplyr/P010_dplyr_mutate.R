# Description: The mutate Verb in dplyr Package

library(dplyr)
library(ggplot2)

# Note
# 1. The mutate() verb is used to add new columns that are functions of existing columns.
# 2. The dplyr::mutate() works the same way as plyr::mutate() and similarly to base::transform(). The key difference
#    between mutate() and transform() is that mutate allows you to refer to columns that you’ve just created.

# The mutate() function will add new columns to the data frame. Create a new column called rem_proportion which is the
# ratio of rem sleep to total amount of sleep.
msleep %>%
    mutate(rem_proportion = sleep_rem / sleep_total) %>%
    head

# Add multiple new columns using mutate (separated by commas). Here we add a second column called bodywt_grams which is
# the bodywt column in grams.
msleep %>%
    mutate(rem_proportion = sleep_rem / sleep_total,
           bodywt_grams = bodywt * 1000) %>%
    head

# TODO
# 1. None
