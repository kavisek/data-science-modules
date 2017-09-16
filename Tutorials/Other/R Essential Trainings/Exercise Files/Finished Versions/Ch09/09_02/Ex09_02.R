# R Statistics Essential Training
# Ex09_02
# Comparing means with a two-factor ANOVA

# Load data 
# Built-in dataset "warpbreaks"
?warpbreaks
data(warpbreaks)
boxplot(breaks ~ wool*tension, data = warpbreaks)

# Model with interaction
aov1 <- aov(breaks ~ 
            wool + tension + wool:tension, 
            # or: wool*tension, 
            data = warpbreaks)
summary(aov1)

# Additional information on model
model.tables(aov1)
model.tables(aov1, type = "means")
model.tables(aov1, type = "effects")  # "effects" is default

# Post-hoc test
TukeyHSD(aov1)

remove(list = ls())  # Clean up