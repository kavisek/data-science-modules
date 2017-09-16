# R Statistics Essential Training
# Ex07_04
# Comparing paired means: Paired t-test

# Load data
# Create random data
t1 <- rnorm(50, mean = 52, sd = 6)  # Time 1
dif <- rnorm(50, mean = 6, sd = 12)  # Difference
t2 <- t1 + dif  # Time 2

# Some quick plots to check data
hist(t1)
hist(dif)
hist(t2)
boxplot(t1, t2)

# Save variables in dataframe and use "MASS"
# to create parallel coordinate plot
pairs <- data.frame(t1, t2)
require("MASS")
parcoord(pairs, var.label = TRUE)

# Paired t-test (with defaults)
t.test(t2, t1, paired = TRUE)

# Paired t-test with options
t.test(t2, t1, 
       paired = TRUE,
       mu = 6,  # Specify non-0 null value
       alternative = "greater",  # One-tailed test
       conf.level = 0.99)  # 99% CI (vs. 95%)

# Clean up
detach("package:MASS", unload=TRUE)
rm(list = ls())