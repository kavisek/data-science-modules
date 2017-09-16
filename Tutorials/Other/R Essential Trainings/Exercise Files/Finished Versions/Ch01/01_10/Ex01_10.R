# R Statistics Essential Training
# Ex01_10
# Exploring Color with RColorBrewer

# Barplot
x = c(12, 4, 21, 17, 13, 9)
barplot(x)

# RColorBrewer
browseURL("http://colorbrewer2.org/")  # Uses Flash
install.packages("RColorBrewer")
help(package = "RColorBrewer")
require("RColorBrewer")

# Show all of the palettes in a graphics window
display.brewer.all()

# To see palette colors in separate window, give number
# of desired colors and name of palette in quotes
display.brewer.pal(8, "Accent")
display.brewer.pal(4, "Spectral")

# Barplots
# Can save palette as vector or call in function
blues <- brewer.pal(6, "Blues")
barplot(x, col = blues)
barplot(x, col = brewer.pal(6, "Greens"))
barplot(x, col = brewer.pal(6, "YlOrRd"))
barplot(x, col = brewer.pal(6, "RdGy"))
barplot(x, col = brewer.pal(6, "BrBG"))
barplot(x, col = brewer.pal(6, "Dark2"))
barplot(x, col = brewer.pal(6, "Paired"))
barplot(x, col = brewer.pal(6, "Pastel2"))
barplot(x, col = brewer.pal(6, "Set3"))

# Clean up
palette("default")  # Return to default
detach("package:RColorBrewer", unload = TRUE)
rm(list = ls())  