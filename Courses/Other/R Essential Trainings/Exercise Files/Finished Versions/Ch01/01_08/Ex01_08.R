# R Statistics Essential Training
# Ex01_08
# Converting tabular data to row data

# Load data
?UCBAdmissions
str(UCBAdmissions)
UCBAdmissions

# The problem
admit.fail <- (UCBAdmissions$Admit)  # Doesn't work
barplot(UCBAdmissions$Admit)  # Doesn't work
plot(UCBAdmissions)  # DOES work but not what we wanted now

# Get marginal frequencies from original table
margin.table(UCBAdmissions, 1)  # Admit
margin.table(UCBAdmissions, 2)  # Gender
margin.table(UCBAdmissions, 3)  # Dept
margin.table(UCBAdmissions)     # Total
?margin.table

# Save marginals as new table
admit.dept <- margin.table(UCBAdmissions, 3)  # Dept
str(admit.dept)
barplot(admit.dept)
admit.dept  # Show frequencies
prop.table(admit.dept)  # Show as proportions
round(prop.table(admit.dept), 2)  # Show as proportions w/2 digits
round(prop.table(admit.dept), 2) * 100  # Give percentages w/o decimal places
?prop.table
?round

# Go from table to one row per case
admit1 <- as.data.frame.table(UCBAdmissions)  # Coerces to data frame
admit2 <- lapply(admit1, function(x)rep(x, admit1$Freq))  # Repeats each row by Freq
admit3 <- as.data.frame(admit2)  # Converts from list back to data frame
admit4 <- admit3[, -4]  # Removes fifth column with frequencies
# Or do it all in one go
admit.rows <- as.data.frame(lapply(as.data.frame.table(UCBAdmissions), function(x)rep(x, as.data.frame.table(UCBAdmissions)$Freq)))[, -4]
str(admit.rows)
admit.rows[1:10, ]  # View first ten rows of data (of 4526)

rm(list = ls())  # Clean up