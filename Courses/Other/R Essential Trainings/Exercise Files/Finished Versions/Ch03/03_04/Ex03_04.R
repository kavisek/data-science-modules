# R Statistics Essential Training
# Ex03_04
# Single mean: Hypothesis test and confidence interval

# Load data
?quakes
quakes[1:5, ]  # See the first 5 lines of the data
mag <- quakes$mag  # Just load the magnitude variable
mag[1:5]  # First 5 lines

# Use t-test for one-sample
# Default t-test (compares mean to 0)
t.test(mag)

# One-sided t-test w/mu = 4
t.test(mag, alternative = "greater", mu = 4)

rm(list = ls())  # Clean up