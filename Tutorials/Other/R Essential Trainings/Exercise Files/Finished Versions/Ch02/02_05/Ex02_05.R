# R Statistics Essential Training
# Ex02_05
# Overlaying Plots

# LOAD DATASET
require("datasets")
?swiss
swiss
str(swiss)
data(swiss)
fertility <- swiss$Fertility

# PLOTS
# Plot 1: Histogram
h <- hist(fertility,
          prob = TRUE,  # Flipside of "freq = FALSE"
          ylim = c(0, 0.04),
          xlim = c(30, 100),
          breaks = 11,
          col = "#E5E5E5",
          border = 0,
          main = "Fertility for 47 French-Speaking\nSwiss Provinces, c. 1888")

# Plot 2: Normal curve (if prob = TRUE)
curve(dnorm(x, mean = mean(fertility), sd = sd(fertility)), 
      col = "red", 
      lwd = 3,
      add = TRUE)

# Plot 3 & 4: Kernel density lines (if prob = TRUE)
lines(density(fertility), col = "blue")
lines(density(fertility, adjust = 3), col = "darkgreen")

# Plot 5: Rug (That is, lineplot under histogram)
rug(fertility, col = "red")

rm(list = ls())  # Clean up