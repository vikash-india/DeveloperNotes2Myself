# Description: The transmute Verb in dplyr Package

library(dplyr)
library(ggplot2)

# Note
# 1. The transmute() verb is equivalent to mutate() + base::transform().
# 2. Use use transmute() only the new mutated variables are to be kept and rest should be dropped.

msleep %>%
    transmute(rem_proportion = sleep_rem / sleep_total,
           bodywt_grams = bodywt * 1000) %>%
    head

# TODO
# 1. None
