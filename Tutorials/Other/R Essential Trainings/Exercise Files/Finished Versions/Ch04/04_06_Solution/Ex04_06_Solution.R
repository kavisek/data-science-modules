# R Statistics Essential Training
# Ex04_06_Solution
# Transforming skewed data

# Import data
xskew <- read.csv("~/Desktop/R/xskew.csv")
x <- xskew[, 2]
hist(x)

# Square data
x2 <- x^2
hist(x2)
boxplot(x2)

# 4th power
x4 <- x^4
hist(x4)
boxplot(x4)

rm(list = ls())  # Clean up
