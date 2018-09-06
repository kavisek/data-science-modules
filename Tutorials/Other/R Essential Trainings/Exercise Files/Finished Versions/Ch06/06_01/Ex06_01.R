# R Statistics Essential Training
# Ex06_01
# Creating bar charts of group means

# Load data
?InsectSprays
spray <- InsectSprays  # Load data with shorter name

# To plot means, first get the means for the groups 
means <- aggregate(spray$count ~ spray$spray, FUN = mean)
means
plot(means)  # Gets lines for means

# To get a barplot, need to extract means and reorganize
mean.data <- t(means[-1])  # Removes first columns, transposes second
colnames(mean.data) <- means[, 1]

# Basic barplot for means
barplot(mean.data)

# Modified barplot
barplot(mean.data,
        col = "lightblue",
        main = "Effectiveness of Insect Sprays",
        xlab = "Spray Used",
        ylab = "Insect Count")

rm(list = ls())