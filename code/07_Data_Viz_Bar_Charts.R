# Data Viz ggplot2 - bar charts

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

# bar chart
ggplot(data = characters) +
  geom_bar(mapping = aes(x=gender))

# load dataset
species <- read_csv('data/star_wars/species.csv')

species <- species %>%
  mutate(classification = as.factor(classification),
         designation = as.factor(designation),
         skin_colors = as.factor(skin_colors),
         hair_colors = as.factor(hair_colors),
         eye_colors = as.factor(eye_colors),
         language = as.factor(language),
         homeworld = as.factor(homeworld))

# check data
summary(species)


# 'color' changes the outline of the bars
# 'fill' changes the inside of the bars
ggplot(data = species) +
  geom_bar(mapping = aes(x=classification, 
                         color=designation,
                         fill=designation))

# to define the y we need to use a column chart
species %>%
  group_by(classification) %>%
  summarize(average_height=mean(average_height)) %>%
  ggplot() +
  geom_col(mapping = aes(x=classification, y=average_height))


# histogram
ggplot(data = characters) +
  geom_histogram(mapping = aes(x=mass))

# histogram custom n of bins
ggplot(data = characters) +
  geom_histogram(mapping = aes(x=mass), bins=40, origin=0)

# histogram custom size of bins
ggplot(data = characters) +
  geom_histogram(mapping = aes(x=mass), binwidth=50, origin=0)


# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
