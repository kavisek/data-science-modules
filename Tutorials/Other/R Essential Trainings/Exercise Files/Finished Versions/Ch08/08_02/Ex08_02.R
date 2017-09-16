# R Statistics Essential Training
# Ex08_02
# Creating scatterplots for grouped data

# Load data
?iris
data(iris)
iris[1:5, ]

# Load "car" package
require(car)  # "Companion to Applied Regression"

# Single scatterplot with groups marked
# Function can be called "scatterplot" or "sp"
sp(Sepal.Width ~ Sepal.Length | Species,
   data = iris, 
   xlab = "Sepal Width", 
   ylab = "Sepal Length", 
   main = "Iris Data", 
   labels = row.names(iris))

# Clean up
detach("package:car", unload=TRUE)
rm(list = ls())
