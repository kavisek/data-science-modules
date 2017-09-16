# R Statistics Essential Training
# Ex03_06
# Robust statistics for univariate analyses

# See "A Brief Overview of Robust Statistics" by Olfa Nasraoui, at
browseURL("http://j.mp/12YPV5L")

# Or see the CRAN Task View on robust statistics at
browseURL("http://cran.r-project.org/web/views/Robust.html")

# Load data
?state.area
data(state.area)  # Gets error message
area <- state.area  # But can save as vector
area
hist(area)
boxplot(area)
boxplot.stats(area)
summary(area)

# Robust methods for describing center:
mean(area)  # NOT robust
median(area)
mean(area, trim = .05)  # 5% from each end (10% total)
mean(area, trim = .10)  # 10% from each end (20% total)
mean(area, trim = .20)  # 20% from each end (40% total)
mean(area, trim = .50)  # 50% from each end = median

# Robust methods for describing variation:
sd(area)  # NOT robust
mad(area)  # Median absolute deviation
IQR(area)  # Interquartile range (Can select many methods)
fivenum(area)  # Tukey's hinges (similar to quartiles)

rm(list = ls())  # Clean up