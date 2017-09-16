# R Statistics Essential Training
# Ex02_08_Solution
# Layering Plots

# Create a single chart that shows Petal.Length 
# from the iris dataset as a histogram, a kernal
# density line, and a rug (line plot).

# Load data
pl <- iris$Petal.Length

# Plot 1: Histogram
hist(pl,
     prob = TRUE,
     breaks = 12,
     col = "#E5E5E5",
     border = 0,
     main = "Petal Lengths from Three Species of Iris")

# Plot 2: Kernel density lines
lines(density(pl), col = "darkred", lwd = 2)

# Plot 3: Rug
rug(pl, col = "darkgray", lwd = 2)

rm(list = ls())  # Clean up