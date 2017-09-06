# R Statistics Essential Training
# Ex06_05_Solution
# Creating your own grouped boxplots

# Load data
gsd <- read.csv("~/Desktop/R/SearchData.csv", header = TRUE)
gsd[1:5, ]

# Draw boxplots of interest in NFL (nfl) by region
# Basic version
boxplot(gsd$nfl ~ gsd$region)
gsd[gsd$region == "Midwest", ]

# Modified version
require("RColorBrewer")
boxplot(gsd$nfl ~ gsd$region,
        col = brewer.pal(4, "Set2"),
        boxwex = 0.5,  # Width of box
        whisklty = 1,  # Whisker line type; 1 = solid line
        staplelty = 0,  # Staple type; 0 = none
        outpch = 16,  # Outlier symbol; 16 = filled circle
        outcol = brewer.pal(4, "Set2"),  # Outlier color
        main = "Google Search Interest in NFL by Region of US",
        xlab = "Region of US",
        ylab = "Search Interest (z-scores)")

# Clean up
detach("package:RColorBrewer", unload=TRUE)
rm(list = ls())