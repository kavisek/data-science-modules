# R Statistics Essential Training
# Ex08_06_Solution
# Creating Scatterplot Matrices

# Load data
gsd <- read.csv("~/Desktop/R/SearchData.csv", header = TRUE)
gsd[1:5, ]

# Scatterplot matrix using "pairs"
# Put histograms on the diagonal (from "pairs" help)
panel.hist <- function(x, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5) )
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y,  ...)
  # Removed "col = "cyan" from code block; original below
  # rect(breaks[-nB], 0, breaks[-1], y, col = "cyan", ...) 
}

pairs(gsd[c(2:4, 8:9)], 
      panel = panel.smooth,  # Optional smoother
      main = "Scatterplot Matrix for Google Search Data Using pairs Function",
      diag.panel = panel.hist, 
      pch = 16, 
      col = "lightgray")

# Scatterplot matrix using "cars"
library(car)
require(RColorBrewer)

scatterplotMatrix(~ nba + nfl + fifa + degree + age,
                  data = gsd,
                  col = brewer.pal(3, "Set2"),
                  main="Scatterplot Matrix for Google Search Data Using \"car\" Package")

# Clean up
detach("package:RColorBrewer", unload=TRUE)
detach("package:car", unload=TRUE)
rm(list = ls())