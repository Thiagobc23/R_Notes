# sampling
library(tidyverse)

poke <- read_csv("data/Pokemon.csv")

# 50% sample
poke %>%
  sample_frac(0.5)

poke_group <- poke %>%
  group_by(`Type 1`)

poke_group %>%
  summary()

# 50% sample - grouped data
poke_group %>%
  sample_frac(0.5) %>%
  summary()

# replace parameter - like inplace with Python's Pandas
poke_group %>%
  sample_frac(0.5, replace = TRUE)

summary(poke_group)

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
