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


# X and Y labels
ggplot(data = poke) +
  geom_bar(mapping = aes(x=tp, fill=tp2))+
  theme(plot.background = element_rect(fill = "grey"),
        panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.major.y = element_line(color='black'))+
  ylab('Number of Pokemon')+
  xlab('Pokemon Main Type')

# limits
ggplot(data = poke) +
  geom_bar(mapping = aes(x=tp, fill=tp2))+
  theme(plot.background = element_rect(fill = "grey"),
        panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.major.y = element_line(color='black'))+
  ylab('Number of Pokemon')+
  xlab('Pokemon Main Type')+
  ylim(0,450)

# change limits and labels with "scale"
ggplot(data = poke) +
  geom_bar(mapping = aes(x=tp, fill=tp2))+
  theme(plot.background = element_blank(),
        panel.background = element_blank())+
  scale_x_discrete(name='Pokemon Main Type')+
  scale_y_continuous(name="Number of Pokemon", 
                     limits = c(0,450))

# change colors
ggplot(data = poke) +
  geom_bar(mapping = aes(x=tp, fill=tp2))+
  theme(plot.background = element_blank(),
        panel.background = element_blank())+
  scale_x_discrete(name='Pokemon Main Type')+
  scale_y_continuous(name="Number of Pokemon", 
                     limits = c(0,450))+
  scale_fill_manual(values = c("#D94040", 
                               "#1F764B", 
                               "#B7B7B7",
                               "#B883BF", 
                               "#5278B9"),
                    na.value="#4B524E")


# define list of colors
my_colors <- c("#D94040", "#1F764B", 
               "#B7B7B7", "#B883BF", 
               "#5278B9") 

# customizing the legend
ggplot(data = poke) +
  geom_bar(mapping = aes(x=tp, fill=tp2))+
  theme(plot.background = element_blank(),
        panel.background = element_blank())+
  scale_x_discrete(name='Pokemon Main Type')+
  scale_y_continuous(name="Number of Pokemon", 
                     limits = c(0,450))+
  scale_fill_manual(values = my_colors,
                    na.value="#4B524E",
                    guide=guide_legend(title = 'Second Type',
                                       nrow=1,
                                       label.position = 'top',
                                       keywidth = 3))+
  theme(legend.position = 'top')

# Annotation
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense))+
  annotate('text', label='Shuckle', x=20, y=230)+
  annotate('text', label='Deoxys', x=174, y=20)

# draw lines
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense))+
  annotate('text', label='Shuckle', x=20, y=230)+
  annotate('text', label='Deoxys', x=174, y=20)+
  geom_hline(yintercept = mean(poke$Defense))+
  geom_vline(xintercept = mean(poke$Attack))


# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
