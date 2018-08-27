# Description: The sample_n and sample_frac Verb in dplyr Package

library(dplyr)
library(ggplot2)

# Note
# 1. Use sample_n() and sample_frac() to take a random sample of rows.
# 2. Use sample_n() for a fixed number and use sample_frac() for a fixed fraction.
# 3. Use replace = TRUE to perform a bootstrap sample. If needed, weight the sample with the weight argument.

# Get a sample of 10 rows
sample_n(msleep, 10)

# Get a sample of 20% of the rows
sample_frac(msleep, .20)

# TODO
# 1. None
