# R Statistics Essential Training
# Ex03_03
# Single proportion: Hypothesis test and confidence interval

# In the 2012 Major League Baseball season,
# the Washington Nationals had the best record 
# at the end of the regular season: 98 wins out
# of 162 games (.605). Is this significantly 
# greater than 50%?

# PROP TEST
# 98 wins out of 162 games (default settings)
prop.test(98, 162)

# One-tailed test with 90% CI
prop.test(98, 162, alt = "greater", conf.level = .90)

rm(list = ls())  # Clean up