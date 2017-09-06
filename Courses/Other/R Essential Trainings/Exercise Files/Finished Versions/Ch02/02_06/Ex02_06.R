# R Statistics Essential Training
# Ex02_06
# Exporting charts

# Load data
require("datasets")
feeds <- table(chickwts$feed)

# The hard way: Via R's code

# For PNG file (Run entire block at once)
png(filename= "~/Desktop/R/Ex02_06a.png",  # Open device
    width = 888,
    height = 571)
par(oma = c(1, 1, 1, 1))  # Outside margins: b, l, t, r
par(mar = c(4, 5, 2, 1))  # Sets plot margins
barplot(feeds[order(feeds)],  # Create the chart
        horiz  = TRUE,
        las    = 1,  # Orientation of axis labels
        col    = c("beige", "blanchedalmond", "bisque1", "bisque2", "bisque3", "bisque4"),
        border = NA,  # No borders on bars
        main   = "Frequencies of Different Feeds\nin chickwts Dataset",
        xlab   = "Number of Chicks")
dev.off()  # Close device (run in same block)

# OR this one for PDF file (Run entire block at once)
pdf("~/Desktop/R/Ex02_06b.pdf",
    width = 9,
    height = 6)
par(oma = c(1, 1, 1, 1))  # Outside margins: b, l, t, r
par(mar = c(4, 5, 2, 1))  # Sets plot margins
barplot(feeds[order(feeds)],  # Create the chart
        horiz  = TRUE,
        las    = 1,  # Orientation of axis labels
        col    = c("beige", "blanchedalmond", "bisque1", "bisque2", "bisque3", "bisque4"),
        border = NA,  # No borders on bars
        main   = "Frequencies of Different Feeds\nin chickwts Dataset",
        xlab   = "Number of Chicks")
dev.off()  # Close device (run in same block)

# The easy Way: With RStudio "Export"

par(oma = c(1, 1, 1, 1))  # Outside margins: b, l, t, r
par(mar = c(4, 5, 2, 1))  # Sets plot margins
barplot(feeds[order(feeds)],  # Create the chart
        horiz  = TRUE,
        las    = 1,  # Orientation of axis labels
        col    = c("beige", "blanchedalmond", "bisque1", "bisque2", "bisque3", "bisque4"),
        border = NA,  # No borders on bars
        main   = "Frequencies of Different Feeds\nin chickwts Dataset",
        xlab   = "Number of Chicks")

rm(list = ls())  # Clean up