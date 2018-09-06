# R Statistics Essential Training
# Ex05_02
# Analyzing by subgroups

# Load data
?iris
data(iris)
iris
mean(iris$Petal.Width)

# Split the data file and repeat analyses
# with "aggregate"
# Compare groups on mean of one variable
aggregate(iris$Petal.Width ~ iris$Species, FUN = mean)

# Compare groups on several variables
# Use cbind to list outcome variables
aggregate(cbind(iris$Petal.Width, iris$Petal.Length) ~ iris$Species, FUN = mean)

rm(list = ls())  # Clean up