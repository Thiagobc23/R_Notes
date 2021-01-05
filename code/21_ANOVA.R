library(tidyverse)

df <- read_csv('data/Pokemon.csv')

df <- df %>%
  rename(type1 = `Type 1`)

# Compute the analysis of variance
res.aov <- aov(Attack ~ type1, data = df)
# Summary of the analysis
summary(res.aov)
