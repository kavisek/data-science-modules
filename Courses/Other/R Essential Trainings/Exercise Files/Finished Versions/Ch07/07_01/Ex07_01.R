# R Statistics Essential Training
# Ex07_01
# Calculating correlations

# Load data
?swiss
data(swiss)

# Correlation matrix for data frame
cor(swiss)
round(cor(swiss), 2)  # Rounded to 2 decimals

# Can test one pair of variables at a time
# Gives r, hypothesis test, and confidence interval
cor.test(swiss$Fertility, swiss$Education)

# Install "Hmisc" package to get p-values for matrix
install.packages("Hmisc")
require("Hmisc")

# Need to coerce from data frame to matrix
# to get correlation matrix and p-values
rcorr(as.matrix(swiss))

# Clean  up
detach("package:Hmisc", unload = TRUE)
rm(list = ls())
