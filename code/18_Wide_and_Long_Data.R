# Convert wide / long data format
library("tidyverse")

df <- read_csv('data/population.csv')
df

# gather
## convert from wide to long
df %>%
  gather(year, population,
         Pop_2011,
         Pop_2014,
         Pop_2016,
         Pop_2017)

# gather - range of columns
df %>%
  gather(year, population,
         Pop_2011:Pop_2017)

# gather - contains
new_df <- df %>%
  gather(year, population,
         contains('Pop'))

new_df

# spread
## convert from long to wide
new_df %>%
  spread(year, population)


# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
