# R Statistics Essential Training
# Ex05_03
# Merging files

# Load data
?longley
data(longley)

# Split up longley
a1 <- longley[1:14, 1:6]  # Starting data
a2 <- longley[1:14, 6:7]  # New column to add (with "Year" to match)
b <- longley[15:16, ]     # New rows to add
write.table(a1, "~/Desktop/R/longley.a1.txt", sep="\t")
write.table(a2, "~/Desktop/R/longley.a2.txt", sep="\t")
write.table(b, "~/Desktop/R/longley.b.txt", sep="\t")
rm(list=ls()) # Clear out everything to start fresh

# Import data
a1t <- read.table("~/Desktop/R/longley.a1.txt", sep="\t")
a2t <- read.table("~/Desktop/R/longley.a2.txt", sep="\t")

# Take early years (a1t) and add columns (a2t)
# Must specify variable to match cases
a.1.2 <- merge(a1t, a2t, by = "Year")  # Merge two data frames
a.1.2  # Check results

# Add two more cases at bottom
b <- read.table("~/Desktop/R/longley.b.txt", sep="\t")
all.data <- rbind(a.1.2, b)  # "Row Bind"
all.data  # Check data
row.names(all.data) <- NULL  # Reset row names
all.data  # Check data

rm(list=ls())  # Clean up
