# R Statistics Essential Training
# Ex07_06
# Comparing proportions

# Load data
# Need two vectors:
# One specifies the total number of people in each group
# This creates a vector with 5 100s in it, for 5 groups
# Same as "number of trials"
n5 <- c(rep(100, 5))
# Another specifies the number of people who are in category
# Same as "number of successes"
x5 <- c(65, 60, 60, 50, 45)
prop.test(x5, n5)

# If there are only two groups, then it gives a confidence
# interval for the difference between the groups; 
# the default CI is .95
n2 <- c(40, 40)  # Number of trials
x2 <- c(30, 20)  # Number of successes
prop.test(x2, n2, conf.level = .80)

rm(list = ls())  # Clean up