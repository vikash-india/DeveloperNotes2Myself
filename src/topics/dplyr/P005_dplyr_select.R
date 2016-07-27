# Description: The select Verb in dplyr Package

library(dplyr)
library(ggplot2)

# Note
# 1. Use library(ggplot2) for msleep data used in all the examples.
# 2. The columns (in order) in the msleep dataset correspond to the following:
#    column name	Description
#    name	        common name
#    genus	        taxonomic rank
#    vore	        carnivore, omnivore or herbivore?
#    order	        taxonomic rank
#    conservation	the conservation status of the mammal
#    sleep_total	total amount of sleep, in hours
#    sleep_rem	    rem sleep, in hours
#    sleep_cycle	length of sleep cycle, in hours
#    awake	        amount of time spent awake, in hours
#    brainwt	    brain weight in kilograms
#    bodywt	        body weight in kilograms
# 3. The select() verb used to rapidly zoom in on a useful subset using operations that usually only work on numeric
#    variable positions.

# Use the select verm for selecting columns
sleepData <- select(msleep, name, sleep_total)

# Select a range of columns by name, use the ":" (colon) operator.
sleepData <- select(msleep, name:order)
head(sleepData)

# Select all the columns except a specific column, use the "-" (subtraction) operator (also known as negative indexing).
sleepData <- select(msleep, -name)
sleepData <- select(msleep, -name:order)
head(sleepData)

# Select all columns that start with the character string "sl", use the function starts_with(). Use ?select to see all
# available additional options. Some additional options are as follows
# to select columns based on a specific criteria include
# 1. ends_with(): Select columns that end with a character string
# 2. contains(): Select columns that contain a character string
# 3. matches(): Select columns that match a regular expression
# 4. one_of(): Select columns names that are from a group of names
sleepData <- select(msleep, starts_with("sl"))
head(sleepData)

# Pipe the msleep data frame to the function that will select two columns (name and sleep_total) and then pipe the new
# data frame to the function head()
msleep %>%
    select(name, sleep_total) %>%
    head

# TODO
# 1. None
