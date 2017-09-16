# R Statistics Essential Training
# Ex03_08_Solution
# Calculating Descriptive Statistics

# Calculate the mean, SD, skewness, and kurtosis
# for mpg, hp, and qsec from mtcars.

# Load Data
data(mtcars)

# Use the package "psych"
require("psych")
d <- describe(mtcars[c(1, 4, 7)])
d[, c(3, 4, 11, 12)]

# Clean up
detach("package:psych", unload = TRUE)
rm(list = ls())