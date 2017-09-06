# R Statistics Essential Training
# Ex06_02
# Creating grouped boxplots

# Load data
# Use dataset "painters" from the package "MASS
require(MASS)
?painters
# For an interesting follow-up on this data, see
# "Taste Endures! The Rankings of Roger de Piles (†1709)
# and Three Centuries of Art Prices" by Kathryn Graddy at
browseURL("http://people.brandeis.edu/~kgraddy/published%20papers/DePiles_complete.pdf")
data(painters)
painters

# Draw boxplots of outcome (Expression) by group (School)
# Basic version
boxplot(painters$Expression ~ painters$School)

# Modified version
require("RColorBrewer")
boxplot(painters$Expression ~ painters$School,
        col = brewer.pal(8, "Pastel2"),
        names  = c("Renais.",
                   "Mannerist",
                   "Seicento",
                   "Venetian",
                   "Lombard",
                   "16th C.",
                   "17th C.",
                   "French"),
#         notch = TRUE,  # Not good because of small samples; don't use
        boxwex = 0.5,  # Width of box
        whisklty = 1,  # Whisker line type; 1 = solid line
        staplelty = 0,  # Staple type; 0 = none
        outpch = 16,  # Outlier symbol; 16 = filled circle
        outcol = brewer.pal(8, "Pastel2"),  # Outlier color
        main = "Expression Ratings of Painters by School\nFrom \"painters\" Dataset in \"MASS\" Package",
        xlab = "Painter's School",
        ylab = "Expression Ratings")

# Clean up
detach("package:MASS", unload=TRUE)
detach("package:RColorBrewer", unload=TRUE)
rm(list = ls())