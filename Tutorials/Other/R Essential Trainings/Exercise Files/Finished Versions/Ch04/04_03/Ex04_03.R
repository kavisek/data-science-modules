# R Statistics Essential Training
# Ex04_03
# Computing composite variables

# Create variable rn1 with 1 million random normal values
# Will vary from one time to another
rn1 <- rnorm(1000000)
hist(rn1)
summary(rn1)

# Create variable rn2 with 1 million random normal values
rn2 <- rnorm(1000000)
hist(rn2)
summary(rn2)

# Average scores across two variables
rn.mean <- (rn1 + rn2)/2
hist(rn.mean)

# Multiply scores across two variables
rn.prod <- rn1 * rn2
hist(rn.prod)
summary(rn.prod)

# Kurtosis comparisons
# The package "moments" gives kurtosis where a
# mesokurtic, normal distribution has a value of 3.
# The package "psych" recenters the kurtosis values
# around 0, which is more common now.
install.packages("psych")
help(package = "psych")
require("psych")
kurtosi(rn1)
kurtosi(rn2)
kurtosi(rn.mean)
kurtosi(rn.prod)  # Similar to Cauchy distribution

# Clean up
detach("package:psych", unload=TRUE)
rm(list = ls())