# R Statistics Essential Training
# Ex07_10_Challenge
# Comparing proportions

# Load data
hw <- read.csv("~/Desktop/R/mlb2011.csv", header = TRUE)
hw[1:5, ]

# Compare all teams
prop.test(hw$HomeWins, hw$AllWins)

# Compare just the highest and lowest
# Milwaukee Brewers: 57/96 = 59%
# Florida Marlins: 31/72 = 43%
x2 <- c(31, 57)  # Number of successes
n2 <- c(72, 96)  # Number of trials
prop.test(x2, n2)

rm(list = ls())  # Clean up