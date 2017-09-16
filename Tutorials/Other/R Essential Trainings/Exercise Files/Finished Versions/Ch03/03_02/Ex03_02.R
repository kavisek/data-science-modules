# R Statistics Essential Training
# Ex03_02
# Calculating descriptives

# LOAD DATASET
require("datasets")
?cars
cars
str(cars)
data(cars)

# CALCULATE DESCRIPTIVES
summary(cars$speed)  # Summary for one variable
summary(cars)  # Summary for entire table

# Tukey's five-number summary: minimum, lower-hinge,
# median, upper-hinge, maximum. No labels.
fivenum(cars$speed)

# Boxplot stats: hinges, n, CI, outliers
boxplot.stats(cars$speed)

# ALTERNATIVE DESCRIPTIVES
# From the package "psych"
help(package = "psych")
install.packages("psych")
require("psych")
describe(cars)

# Clean up
detach("package:psych", unload=TRUE)
rm(list = ls())