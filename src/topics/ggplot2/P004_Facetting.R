# Description: Facetting in R
library(ggplot2)

# Note
# 1. Facetting is used to display additional categorical variables on a plot. Facetting creates tables of graphics by
#    splitting the data into subsets and displaying the same graph for each subset.
# 2. There are two types of facetting: grid and wrapped.

# Facet a plot by adding a facetting specification using facet wrap(). It takes the name of a variable preceded by ~.
ggplot(mpg, aes(displ, hwy)) + geom_point() + facet_wrap(~class)

# TODO
# 1. None
