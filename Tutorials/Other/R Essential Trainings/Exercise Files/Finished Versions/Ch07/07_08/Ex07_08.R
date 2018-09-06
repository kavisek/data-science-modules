# R Statistics Essential Training
# Ex07_08
# Computing robust statistics for bivariate associations

# Robust regression: A sampling of packages
help(package = "robust")
help(package = "robustbase")
help(package = "MASS")  # See rlm ("robust linear model")
help(package = "quantreg")  # Quantile regression

# Example from "quantreg" package
install.packages("quantreg")
require(quantreg)
?rq  # Help on "quantile regression" in quantreg package
data(engel)
?engel
attach(engel)

plot(income,  # Create plot frame
     foodexp,
     xlab = "Household Income",
     ylab = "Food Expenditure",
     type = "n", 
     cex = .5)
points(income,  # Points in plot
       foodexp,
       pch = 16,
       col = "lightgray")
taus <- c(.05, .1, .25, .75, .9, .95)  # Quantiles
xx <- seq(min(income), max(income), 100)  # X values
f <- coef(rq((foodexp)~(income), tau=taus))  # Coefficients
yy <- cbind(1, xx)%*%f  # Y values
for(i in 1:length(taus)){  # For each quantile value...
  lines(xx, yy[, i], col = "darkgray")  # Draw regression
}
abline(lm(foodexp ~ income),  # Standard LS regression
       col = "darkred",
       lwd = 2)
abline(rq(foodexp ~ income),  # Median regression
       col = "blue",
       lwd = 2)
legend(3000, 1000,  # Plot legend
       c("mean fit", "median fit"),
       col = c("darkred", "blue"),
       lty = 1,
       lwd = 2)

# Clean up
detach(engel)
detach("package:robust", unload=TRUE)
detach("package:quantreg", unload=TRUE)
detach("package:MASS", unload=TRUE)
detach("package:rrcov", unload=TRUE)
rm(list = ls())  
