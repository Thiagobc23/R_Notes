# Data Viz ggplot2

#install.packages("tidyverse")
#install.packages("ggmap")

library(tidyverse)

# load dataset
characters <- read_csv('data/star_wars/characters.csv')
characters

# check data
summary(characters)

# change types from char to factor
characters <- characters %>%
  mutate(hair_color=as.factor(hair_color), 
         skin_color=as.factor(skin_color),
         gender=as.factor(gender),
         homeworld=as.factor(homeworld),
         species=as.factor(species))


ggplot(data=characters) +
  geom_point(mapping = aes(x=mass, y=height, shape=gender))


ggplot(data=characters) +
  geom_point(mapping = aes(x=mass, y=height, color=gender))


# load dataset
planets <- read_csv('data/star_wars/planets.csv')
planets

planets <- planets %>%
  mutate(climate=as.factor(climate), 
         gravity=as.factor(gravity),
         terrain=as.factor(terrain))

summary(planets)

ggplot(data=planets) +
  geom_point(mapping = aes(x=rotation_period, 
                           y=orbital_period, 
                           size=diameter,
                           color=population), alpha=0.5)


# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L


            