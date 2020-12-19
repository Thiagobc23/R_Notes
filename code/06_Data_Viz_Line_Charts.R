# Data Viz ggplot2 - line charts

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


# line
ggplot(data=characters, mapping = aes(x=mass, y=height)) +
  geom_line()

# line with points
ggplot(data=characters, mapping = aes(x=mass, y=height)) +
  geom_line() +
  geom_point()

# smoothing line
ggplot(data=characters, mapping = aes(x=mass, y=height)) +
  geom_smooth() +
  geom_point()

# smoothing line without Standard error
ggplot(data=characters, mapping = aes(x=mass, y=height)) +
  geom_smooth(se=FALSE) +
  geom_point()

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L


