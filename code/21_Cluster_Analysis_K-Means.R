# Cluster Analysis

library('datasets')

head(iris)

# First argument is the data we'll use to cluster
## in this case, all columns but the last one
# Second argument is the number of clusters
clusters <- kmeans(iris[1:4], 3)
clusters


# k-means uses random sampling 
## the results of two consecultive analysis may be different
clusters <- kmeans(iris[1:4], 3)
clusters

# Cluster means:
## Are the centroids. The mean value for each cluster, for each variable

# Within cluster sum of squares by cluster:
## Difference between the values of that cluster and it's mean
## a measure of variance in the cluster

# between_SS / total_SS -> 
## used to evaluate the accuracy of the cluster analysis
## similar to an f score, but without the degrees of freedom