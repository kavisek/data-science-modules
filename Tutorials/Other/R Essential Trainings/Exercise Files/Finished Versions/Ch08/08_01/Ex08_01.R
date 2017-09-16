# R Statistics Essential Training
# Ex08_01
# Creating clustered bar chart for frequencies

# Load data
# Built-in dataset "warpbreaks"
?warpbreaks
# Doesn't work:
barplot(breaks ~ wool*tension, data = warpbreaks)

data <- tapply(warpbreaks$breaks,
               list(warpbreaks$wool,
                    warpbreaks$tension),
               mean)

barplot(data,
        beside = TRUE,
        col = c("steelblue3", "thistle3"),
        bor = NA,
        main = "Mean Number of Warp Breaks\nby Tension and Wool",
        xlab = "Tension",
        ylab = "Mean Number of Breaks")

# For legend, "locator(1)" is interactive and lets you click
# where you want to put the legend. You can also specify
# with coordinates.
legend(locator(1),
       rownames(data),
       fill = c("steelblue3", "thistle3"))

rm(list = ls())  # Clean up
