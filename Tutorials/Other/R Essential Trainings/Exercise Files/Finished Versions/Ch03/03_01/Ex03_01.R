# R Statistics Essential Training
# Ex03_01
# Calculating frequencies

# LOAD DATASET
# Data is the number of hits (in millions) for each word on Google
groups <- c(rep("blue",   3990),
            rep("red",    4140),
            rep("orange", 1890),
            rep("green",  3770),
            rep("purple",  855))

# CREATE FREQUENCY TABLES
groups.t1 <- table(groups)  # Creates frequency table 
groups.t1  # Print table

# MODIFY FREQUENCY TABLES
groups.t2 <- sort(groups.t1, decreasing = TRUE)  # Sorts by frequency, saves table
groups.t2  # Print table

# PROPORTIONS AND PERCENTAGES
prop.table(groups.t2)  # Give proportions of total
round(prop.table(groups.t2), 2)  # Give proportions w/2 decimal places
round(prop.table(groups.t2), 2) * 100  # Give percentages w/o decimal places

rm(list = ls())  # Clean up