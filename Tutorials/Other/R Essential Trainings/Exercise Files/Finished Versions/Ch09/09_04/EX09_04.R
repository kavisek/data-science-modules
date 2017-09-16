# R Statistics Essential Training
# Ex09_04
# Conducting a principal components/factor analysis

# From "psych" package documentation (p. 213)
# "The primary empirical difference between a components 
# versus a factor model is the treatment of the variances
# for each item. Philosophically, components are weighted
# composites of observed variables while in the factor
# model, variables are weighted composites of the factors."

# Load data 
?mtcars
data(mtcars)
mtcars[1:5, ]
mtcars1 <- mtcars[, c(1:4, 6:7, 9:11)]  # Select variables
mtcars1[1:5, ]

# Principle components model using default method
# If using entire data frame:
pc <- prcomp(mtcars1,
             center = TRUE,  # Centers means to 0 (optional)
             scale = TRUE)  # Sets unit variance (helpful)
# Or specify variables:
# pc <- prcomp(~ mpg + cyl + disp + hp + wt + qsec + am + 
#                gear + carb, data = mtcars, scale = TRUE)
?prcomp  # Generally preferred
?princomp  # Very slightly different method, similar to S

# Get summary stats
summary(pc)

# Screeplot
plot(pc)

# Get standard deviations and how variables load on PCs
pc

# See how cases load on PCs
predict(pc)

# Biplot
biplot(pc)

# Factor Analysis
# Varimax rotation by default
# Gives chi square test that number of factors
# is sufficient to match data (want p > .05).
# Also gives uniqueness values for variables,
# variable loadings on factors, and variance
# statistics.
factanal(mtcars1, 1)
factanal(mtcars1, 2)
factanal(mtcars1, 3)
factanal(mtcars1, 4)  # First w/p > .05

rm(list = ls())  # Clean up
