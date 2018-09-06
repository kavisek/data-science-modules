# R Statistics Essential Training
# Ex06_03
# Creating scatterplots

# Load data
?cars
data(cars)
cars

# Basic scatterplot
plot(cars)

# Modified scatterplot
plot(cars,
     pch = 16,
     col = "gray",
     main = "Speed vs. Stopping Distance for Cars in 1920s\nFrom \"cars\" Dataset",
     xlab = "Speed (MPH)",
     ylab = "Stopping Distance (feet)")
# Linear regression line
abline(lm(cars$dist ~ cars$speed), 
       col = "darkred", 
       lwd = 2)  
# "locally weighted scatterplot smoothing"
lines(lowess (cars$speed, cars$dist), 
      col = "blue", 
      lwd = 2)  

# "car" package ("Companion to Applied Regression")
# Has many variations on scatterplots
install.packages("car")
help(package = "car")
require(car)
# "scatterplot" has marginal boxplots, smoothers, and quantile regression intervals
scatterplot(cars$dist ~ cars$speed,
            pch = 16,
            col = "darkblue",
            main = "Speed vs. Stopping Distance for Cars in 1920s\nFrom \"cars\" Dataset",
            xlab = "Speed (MPH)",
            ylab = "Stopping Distance (feet)")

# Clean up
detach("package:car", unload=TRUE)
rm(list = ls())
