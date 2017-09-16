# R Statistics Essential Training
# Ex09_01
# Computing a multiple regression

# Load data
?USJudgeRatings
data(USJudgeRatings)
USJudgeRatings[1:5, ]

# Basic multiple regression
reg1 <- lm(RTEN ~ CONT + INTG + DMNR + DILG + CFMG + 
           DECI + PREP + FAMI + ORAL + WRIT + PHYS,
           data = USJudgeRatings)
reg1  # Gives the coefficients only
summary(reg1)  # Much more

# More detailed summaries
anova(reg1)
coef(reg1)  # Or coefficients(reg1)
confint(reg1)  # CI for coefficients
resid(reg1)  # Or residuals; Residuals case-by-case
hist(residuals(reg1))  # Histogram of residuals
# And others

# Possibility of stepwise variables selection
# (backwards and forwards); exercise caution!

# Backwards stepwise regression
# Repeating the first regression model, which contains
# all of the predictor variables and serves as the 
# starting point
reg1 <- lm(RTEN ~ CONT + INTG + DMNR + DILG + CFMG + 
           DECI + PREP + FAMI + ORAL + WRIT + PHYS,
           data = USJudgeRatings)
regb <- step(reg1,
             direction = "backward",
             trace = 0)  # Don't print the steps
summary(regb)

# Forwards stepwise regression
# Start with model that has nothing but a constant
reg0 <- lm(RTEN ~ 1, data = USJudgeRatings)  # Minimal model
reg0
regf <- step(reg0,  # Start with minimal model
             direction = "forward",
             scope = (~ CONT + INTG + DMNR + DILG + 
                        CFMG + DECI + PREP + FAMI + 
                        ORAL + WRIT + PHYS),
             data = USJudgeRatings,
             trace = 0)  # Don't print the steps
summary(regf)

# For many more options, see the "rms" package
# ("Regression Modeling Strategies")

rm(list = ls())  # Clean up