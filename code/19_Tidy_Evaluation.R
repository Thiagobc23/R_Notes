# Tidy evaluation
library('tidyverse')

df <- read_csv('data/star_wars/characters.csv')
df

# quosure - quo()
## keep track of an enviorment

col_name <- quo(name)

# unquoting - !!
## extract the variables
df %>%
  select(!!col_name)

# unquoting - UQ()
## extract the variables
df %>%
  select(UQ(col_name))


# multiple columns
## quos()
col_names <- quos(name, height, mass)

## !!!
df %>%
  select(!!!col_names)

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
