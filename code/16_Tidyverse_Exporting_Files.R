# Exporting csv
library('tidyverse')

# read csv
df <- read_csv('data/Pokemon.csv')
df

# change column names
colnames(df) <- tolower(make.names(colnames(df)))
df

# add column
df <- df %>%
  mutate(types = paste0(type.1,' ',type.2))

df$types

# write csv
df %>%
  write_csv('data/Pokemon2.csv')
## check file
df2 <- read_csv('data/Pokemon2.csv')

# append to csv
df %>%
  write_csv('data/Pokemon2.csv', append=TRUE)

## check csv
df2 <- read_csv('data/Pokemon2.csv')

# read csv
poke <- read_csv('data/Pokemon.csv')
poke

# write .rdata (R's own format)
poke %>%
  save(file = "data/Pokemon.rdata")

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
