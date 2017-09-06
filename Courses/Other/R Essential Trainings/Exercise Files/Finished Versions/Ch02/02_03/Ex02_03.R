# R Statistics Essential Training
# Ex02_03
# Creating histograms for quantitative variables

# LOAD DATASETS PACKAGE
require("datasets")
?lynx
data(lynx)  # Annual Canadian Lynx trappings 1821-1934

# Make a histogram using the defaults
hist(lynx)
?hist

# Modify histogram
h <- hist(lynx,  # Save histogram as object
          breaks = 11,  # "Suggests" 11 bins
#           breaks = seq(0, 7000, by = 100),
#           breaks = c(0, 100, 300, 500, 3000, 3500, 7000),
          freq = FALSE,
          col = "thistle1", # Or use: col = colors() [626]
          main = "Histogram of Annual Canadian Lynx Trappings\n1821-1934",
          xlab = "Number of Lynx Trapped")

# IF freq = FALSE, this will draw normal distribution
curve(dnorm(x, mean = mean(lynx), sd = sd(lynx)), 
      col = "thistle4", 
      lwd = 2,
      add = TRUE)
?curve

rm(list = ls())  # Clean up