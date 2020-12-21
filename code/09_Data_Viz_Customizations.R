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
                                .default = "Others"))
         )


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

# custom themes (pre built themes)
# bw -> black and white
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense))+
  theme_bw()

# custom themes (pre built themes)
# minimal -> remove most elements
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense))+
  theme_minimal()

# custom themes (pre built themes)
# void -> remove almost every element
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense))+
  theme_void()

# custom themes (pre built themes)
# dark -> dark grey bg
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense))+
  theme_dark()

# ggthemes
install.packages('ggthemes')
library(ggthemes)

# custom themes (ggthemes)
# solarized -> sun/ old paper like bg
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense))+
  theme_solarized()

# custom themes (ggthemes)
# excel -> looks like ms excel
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense))+
  theme_excel()

# custom themes (ggthemes)
# wsj -> wall street journal
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense))+
  theme_wsj()

# custom themes (ggthemes)
# economist -> similar to The Economist charts
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense))+
  theme_economist()

# custom themes (ggthemes)
# fivethirtyeight -> similar to fivethirtyeight charts
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense))+
  theme_fivethirtyeight()

# Example Custom Viz
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense, color=Legendary))+
  annotate('text', label='Shuckle', x=20, y=230, color='white')+
  annotate('text', label='Deoxys', x=174, y=20, color='white') +
  scale_color_manual(values = c('#F85C54','#2ACC74'),
                    guide=guide_legend(title = 'Legendary',
                                       nrow=1,
                                       reverse=TRUE),
                    labels = c('No', 'Yes'))+
  geom_hline(yintercept = mean(poke$Defense), 
             color='#F85C54',
             size=1, alpha=0.5)+
  geom_vline(xintercept = mean(poke$Attack), 
             color='#F85C54',
             size=1, alpha=0.5)+
  labs(title="Pokemon Attack X Defense",
       subtitle = "Stats values from Pokemon Games (Not Pokemon Cards or Pokemon GO",
       caption = "Source: https://www.kaggle.com/abcsds/pokemon")+
  theme(legend.position = 'bottom', 
        legend.background = element_blank(),
        legend.key = element_rect(colour = NA, fill = NA),
        legend.title = element_text(color = "white", size = 11),
        legend.text = element_text(color = "white"),
        axis.text.x = element_text(color="white"),
        axis.text.y = element_text(color="white"),
        axis.title.x = element_text(color = "white"),
        axis.title.y = element_text(color = "white"),
        axis.line = element_line(color = "white"),
        plot.background = element_rect(fill = "#424242"),
        panel.background = element_rect(fill = "#424242"),
        panel.grid.major = element_line(color='#848484'),
        panel.grid.minor = element_blank(),
        plot.title = element_text(color = "white", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "white"),
        plot.caption = element_text(color = "white", face = "italic"))

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
