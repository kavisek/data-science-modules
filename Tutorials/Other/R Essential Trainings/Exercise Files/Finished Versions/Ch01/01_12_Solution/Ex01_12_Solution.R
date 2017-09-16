# R Statistics Essential Training
# Ex01_12_Solution
# Creating color palettes

# For all of these challenges, create barplots with the
# required number of bars, all at uniform height

# Create values for barplot
n <- 5  # Number of bars needed
x <- c(rep(10, n))  # Creates n bars of uniform height
barplot(x, col = rainbow(n))  # Uses x and n

# Using R's built-in palettes

# 1. Show 5 different categories
n <- 5
x <- c(rep(10, n))
barplot(x, col = rainbow(n))

# 2. Show 8 sequential values
n <- 8
x <- c(rep(10, n))
barplot(x, col = heat.colors(n))

# 3. Show 11 divergent values
n <- 11
x <- c(rep(10, n))
barplot(x, col = cm.colors(n))

# Using RColorBrewer
require("RColorBrewer")
display.brewer.all()

# 4. Show 7 different categories
n <- 7
x <- c(rep(10, n))
barplot(x, col = brewer.pal(n, "Set1"))
display.brewer.pal(n, "Set1")

# 5. Show 6 sequential values
n <- 6
x <- c(rep(10, n))
barplot(x, col = brewer.pal(n, "BuPu"))
display.brewer.pal(n, "BuPu")

# 6. Show 9 divergent values
n <- 9
x <- c(rep(10, n))
barplot(x, col = brewer.pal(n, "PRGn"))
display.brewer.pal(n, "PRGn")

# Clean up
detach("package:RColorBrewer", unload=TRUE)
rm(list = ls()) 
