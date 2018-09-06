# R Statistics Essential Training
# Ex02_01
# Creating bar charts for categorical variables

# HELP ON PLOTS
?plot

# LOAD DATASETS PACKAGE
require("datasets")

# ONE ROW PER CASE
?chickwts
chickwts  # Look at data
data(chickwts)  # Load data into workspace

# Quickest Method
plot(chickwts$feed)  # Plot feed from chickwts
?plot

# "barplot" offers more control but must prepare data:
# R doesn't create bar charts directly from the categorical
# variables; instead, we must first create a table that
# has the frequencies for each level of the variable.
feeds <- table(chickwts$feed)
feeds
barplot(feeds)  # Identical to plot(chickwts$feed)
?barplot

# To put the bars in descending order, add "order":
barplot(feeds[order(feeds, decreasing = TRUE)])

# Customize the chart
par(oma = c(1, 1, 1, 1))  # Sets outside margins: b, l, t, r
par(mar = c(4, 5, 2, 1))  # Sets plot margins
barplot(feeds[order(feeds)], 
        horiz  = TRUE,
        las    = 1,  # las gives orientation of axis labels
        col    = c("beige", "blanchedalmond", "bisque1", "bisque2", "bisque3", "bisque4"),
        border = NA,  # No borders on bars
        main   = "Frequencies of Different Feeds\nin chickwts Dataset",  # \n = line break
        xlab   = "Number of Chicks")
?par

rm(list = ls())  # Clean up