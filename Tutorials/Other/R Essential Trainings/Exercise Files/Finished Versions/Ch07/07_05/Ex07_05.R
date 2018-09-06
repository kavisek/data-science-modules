# R Statistics Essential Training
# Ex07_05
# Comparing means with ANOVA

# Load data
# Each group in separate variable
x1 <- rnorm(30, mean = 40, sd = 8)
x2 <- rnorm(30, mean = 41, sd = 8)
x3 <- rnorm(30, mean = 45, sd = 8)
x4 <- rnorm(30, mean = 45, sd = 8)
# Formula result is F(3, 116) = 3.24, p = .025
boxplot(x1, x2, x3, x4)  # Quick graphical check
# Combine vectors into a single data frame
xdf <- data.frame(cbind(x1, x2, x3, x4))
summary(xdf)
# Stack data to get one column with outcome
# and second columns with group
xs <- stack(xdf)

# Conduct one-way ANOVA
anova1 <- aov(values ~ ind, data = xs)
anova1
summary(anova1)

# Post-hoc comparisons
TukeyHSD(anova1)
?pairwise.t.test  # Other post-hoc tests
?p.adjust  # Specific methods

rm(list = ls())  # Clean up