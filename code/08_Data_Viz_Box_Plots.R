# Data Viz ggplot2 - box plots

#install.packages("tidyverse")
#install.packages("ggmap")

library(tidyverse)

# load dataset
characters <- read_csv('data/star_wars/characters.csv')
characters

# change types from char to factor
characters <- characters %>%
  mutate(hair_color=as.factor(hair_color), 
         skin_color=as.factor(skin_color),
         gender=as.factor(gender),
         homeworld=as.factor(homeworld),
         species=as.factor(species))

# check data
summary(characters)


ggplot(data = characters) +
  geom_boxplot(mapping=aes(x=gender, y=height))

########################################################

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L


