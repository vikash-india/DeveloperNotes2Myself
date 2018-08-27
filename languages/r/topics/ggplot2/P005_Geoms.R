# Description: Geoms in ggplot2

library(ggplot2)

# The most commonly used plot types.
# 1. geom smooth() fits a smoother to the data and displays the smooth and its standard error.
# 2. geom boxplot() produces a box-and-whisker plot to summarise the distribution of a set of points.
# 3. geom histogram() and geom freqpoly() show the distribution of continuous variables.
# 4. geom bar() shows the distribution of categorical variables.
# 5. geom path() and geom line() draw lines between the data points. A line plot is constrained to produce lines that
#    travel from left to right, while paths can go in any direction. Lines are typically used to explore how things
#    change over time.

# Use a smooth to see the dominant pattern when it is difficult with scatterplot with a lot of noise.
ggplot(mpg, aes(displ, hwy)) + geom_point() + geom_smooth()

# Remove the confidence interval with geom smooth(se = FALSE).
ggplot(mpg, aes(displ, hwy)) + geom_point() + geom_smooth(se = FALSE)



# TODO
# 1. None
