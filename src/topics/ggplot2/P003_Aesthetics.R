# Description: Aesthetics in ggplot2
library(ggplot2)

# Simple scatter plot using data, aesthetics and geoms.
# 1. The data and aesthetic mappings are supplied in ggplot(), then layers are added on it with +.
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()

# 2. Since almost every plot maps a variable to x and y, so naming these aesthetics variables are optional.
ggplot(mpg, aes(displ, hwy)) + geom_point()

# 3. Add color to the plot.
# - The ggplot2 package takes care of the details of converting data (e.g., ‘f’, ‘r’, ‘4’) into aesthetics (e.g., ‘red’,
#   ‘yellow’, ‘green’) with a scale.
# - There is one scale for each aesthetic mapping in a plot. The scale is also responsible for creating a guide, an axis
#   or legend, that allows you to read the plot, converting aesthetic values back into data values.
ggplot(mpg, aes(displ, hwy, colour = class)) + geom_point()

# 4. Add shape, and size.
ggplot(mpg, aes(x = displ, y = hwy, shape = drv)) + geom_point()
ggplot(mpg, aes(x = displ, y = hwy, size = cyl)) + geom_point()

# 5. Combining all three in the same plot
ggplot(mpg, aes(displ, hwy, color = class, shape = drv, size = cyl)) + geom_point()


# 6. Set an aesthetic to a fixed value, without scaling it, do so in the individual layer outside of aes().
ggplot(mpg, aes(displ, hwy)) + geom_point(aes(colour = "blue")) # The value “blue” is scaled to a pinkish colour,
                                                                # and a legend is added.
ggplot(mpg, aes(displ, hwy)) + geom_point(colour = "blue")      # The points are given the R colour blue.

# Note
# - The colour and shape work well with categorical variables.
# - The size works well for continuous variables.

# TODO
# 1. None
