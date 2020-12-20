# Data Viz ggplot2 - customizations

library(tidyverse)

# load data
poke <- read_csv('data/Pokemon.csv')
poke

poke <- poke %>%
  mutate(type = as.factor(`Type 1`),
         type2 = as.factor(`Type 2`),
         tp = as.factor(recode(`Type 1`,
                        "Fire" = "Fire",
                        "Water" = "Water",
                        "Grass" = "Grass",
                        "Normal" = "Normal",
                        "Psychic" = "Psychic",
                        .default = "Others")),
         tp2 = as.factor(recode(`Type 2`,
                                "Fire" = "Fire",
                                "Water" = "Water",
                                "Grass" = "Grass",
                                "Normal" = "Normal",
                                .default = "Others")))


summary(poke)

# plot.backgroud()
# panel.backgroud()
ggplot(data = poke) +
  geom_bar(mapping = aes(x=tp, fill=tp2))+
  theme(plot.background = element_rect(fill = "grey"),
        panel.background = element_rect(fill = "grey"))

# remove bg
ggplot(data = poke) +
  geom_bar(mapping = aes(x=tp, fill=tp2))+
  theme(plot.background = element_blank(),
        panel.background = element_blank())

# same but with two calls on 'theme'
ggplot(data = poke) +
  geom_bar(mapping = aes(x=tp, fill=tp2)) +
  theme(plot.background = element_blank()) +
  theme(panel.background = element_blank())

# grid lines
ggplot(data = poke) +
  geom_bar(mapping = aes(x=tp, fill=tp2))+
  theme(plot.background = element_rect(fill = "grey"),
        panel.background = element_blank(),
        panel.grid.major = element_line(color='black'))

# grid lines
ggplot(data = poke) +
  geom_bar(mapping = aes(x=tp, fill=tp2))+
  theme(plot.background = element_rect(fill = "grey"),
        panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.major.y = element_line(color='black'))



# plot.backgroud()
# panel.backgroud()
# panel.grid.major()
# panel.grid.minor()


# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
