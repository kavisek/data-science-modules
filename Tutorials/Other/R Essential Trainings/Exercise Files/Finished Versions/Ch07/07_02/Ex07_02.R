# R Statistics Essential Training
# Ex07_02
# Computing a bivariate regression

# Load data
?trees
data(trees)
trees[1:5, ]  # Show first 5 lines

# Quick graphical check on data
hist(trees$Height)
hist(trees$Girth)
plot(trees$Girth, trees$Height)
abline(lm(trees$Height ~ trees$Girth))

# Linear regression model
reg1 <- lm(Height ~ Girth, data = trees)
reg1
summary(reg1)

# Confidence intervals for coefficients
confint(reg1)

# Predict values based on regression equation
predict(reg1)  # Predicted height based on girth
predict(reg1, interval = "prediction")  # CI for predicted height

# Regression diagnostics
lm.influence(reg1)
influence.measures(reg1)

rm(list = ls())  # Clean up
