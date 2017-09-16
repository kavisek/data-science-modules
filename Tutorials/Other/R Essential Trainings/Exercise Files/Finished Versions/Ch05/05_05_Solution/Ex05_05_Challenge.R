# R Statistics Essential Training
# Ex05_05_Solution
# Analyzing data by subgroups

# Load data
?ToothGrowth

aggregate(ToothGrowth$len ~ ToothGrowth$supp, FUN = mean)
aggregate(ToothGrowth$len ~ ToothGrowth$supp, FUN = median)