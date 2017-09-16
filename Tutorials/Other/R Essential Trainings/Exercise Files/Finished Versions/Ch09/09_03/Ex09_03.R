# R Statistics Essential Training
# Ex09_03
# Conducting a cluster analysis

# Load data
?mtcars
data(mtcars)
mtcars[1:5, ]
mtcars1 <- mtcars[, c(1:4, 6:7, 9:11)]  # Select variables
mtcars1[1:5, ]

# Three major kinds of clustering:
#   1. Split into set number of clusters (e.g., kmeans)
#   2. Hierarchical: Start separate and combine
#   3. Dividing: Start with a single group and split

# We'll use hierarchical clustering
# Need distance matrix (dissimilarity matrix)
d <- dist(mtcars1)
d  # Huge matrix

# Use distance matrix for clustering
c <- hclust(d)
c

# Plot dendrogram of clusters
plot(c)

# Put observations in groups
# Need to specify either k = groups or h = height
g3 <- cutree(c, k = 3)  # "g3" = "groups 3"
# cutree(hcmt, h = 230) will give same result
g3
# Or do several levels of groups at once
# "gm" = "groups/multiple"
gm <- cutree(c, k = 2:5) # or k = c(2, 4)
gm

# Draw boxes around clusters
rect.hclust(c, k = 2, border = "gray")
rect.hclust(c, k = 3, border = "blue")
rect.hclust(c, k = 4, border = "green4")
rect.hclust(c, k = 5, border = "darkred")

# k-means clustering
km <- kmeans(mtcars1, 3)
km

# Graph based on k-means
require(cluster)
clusplot(mtcars1,  # data frame
         km$cluster,  # cluster data
         color = TRUE,  # color
#          shade = TRUE,  # Lines in clusters
         lines = 3,  # Lines connecting centroids
         labels = 2)  # Labels clusters and cases

rm(list = ls())  # Clean up