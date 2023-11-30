# Multivariate exploration and visualisation
# Daniel Meloncelli - 2023

# Load the libraries
library(magrittr) #pipe operator
library(purrr) #map() function 
library(GGally) #ggpairs

# Load the data
data(iris)

# Summary of the dataset
summary(iris)

# Univariate summaries for each variable.
colMeans(iris[,-5]) #Column means
apply(iris[-5], 2, sd) #Column standard deviations
apply(iris[-5], 2, quantile, 0.95) #Column 95th percentiles

# Multivariate summary
cov(iris[,-5]) #Variance-covariance matrix
cor(iris[,-5]) #Correlation matrix

# Multivariate summaries applied to subgroups
iris %>% # Start with dataset iris
  split(iris$Species) %>% # Split it according to its species column
  map(~.[-5]) %>% # For each species, throw away the last column (Species)
  map(cov)

# Visualisation
ggpairs(iris, aes(colour=Species, alpha = 0.7))
ggpairs(iris)

sessionInfo()
