# R Statistics Essential Training
# Ex07_03
# Comparing means with the t-test

# Load data
?sleep
sleep[1:5, ]
sd <- sleep[, 1:2]  # Save just the first two variables
sd[1:5, ]  # Show the first 5 cases

# Some quick plots to check data
hist(sd$extra, col = "lightgray")
boxplot(extra ~ group, data = sd)

# Independent 2-group t-test (with defaults)
t.test(extra ~ group, data = sd)

# t-test with options
t.test(extra ~ group,
       data = sd,
       alternative = "less",  # One-tailed test
       conf.level = 0.80)  # 80% CI (vs. 95%)

# Create two groups of random data in separate variables
# Good because actual difference is known
x <- rnorm(30, mean = 20, sd = 5)
y <- rnorm(30, mean = 22, sd = 5)
t.test(x, y)

rm(list = ls())  # Clean up