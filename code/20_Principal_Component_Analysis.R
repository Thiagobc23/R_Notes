# PCA - Principal Component Analysis
# more info: https://royalsocietypublishing.org/doi/10.1098/rsta.2015.0202

library(psych)
library(tidyverse)

df <- read.csv('data/Pokemon.csv')

df_num <- df %>%
  select(Total:Speed)

pca_model <- principal(df_num, nfactors = 3, rotate = 'varimax', scores = TRUE)
pca_model

## ssloadings are the eigenvalues
## it its a coeffiecient that represents how much a variable represents of the total variance
## PCA selects the variables with the highest eigenvalue 
## the number of factors can be defined by nfactors
## a good measure is picking the variables with an eigenvalue higher than one

## Varimax rotation method keeps components uncorrelated

## h2 is communality and u2 uniqueness
## communality estimate how strong a variable is related to all the factors
## uniqueness estimates how unique or un-related to all the factors they are