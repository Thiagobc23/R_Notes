# Selecting and Filtering - Tidyverse

library("tidyverse")

## read csv
df <- read_csv('data/Pokemon.csv')
df

# display headers and first records
head(df)

# select columns
df %>%
  select(`Type 1`, `Type 2`)

# select columns and get unique combinations
df %>%
  select(`Type 1`, `Type 2`) %>%
  unique()

# filtering
df %>%
  filter(`Type 1` == 'Poison')

# filtering numbers
df %>%
  filter(Attack > 100)

# max/min
df %>%
  filter(Attack > 100) %>%
  .[[1]] %>%
  max()

df %>%
  filter(Attack > 100) %>%
  .[[1]] %>%
  min()

# multiple filters
df %>%
  filter(HP >= 100) %>%
  filter(Attack >= 100) %>%
  filter(Defense >= 100) %>%
  filter(Speed >= 100) %>%
  filter(`Sp. Atk` >= 100) %>%
  filter(`Sp. Def` >= 100) %>%
  filter(Generation == 1) %>%
  .[[2]]

# select to remove columns
df %>%
  filter(HP >= 100) %>%
  filter(Attack >= 100) %>%
  filter(Defense >= 100) %>%
  filter(Speed >= 100) %>%
  filter(`Sp. Atk` >= 100) %>%
  filter(`Sp. Def` >= 100) %>%
  filter(Generation < 3) %>%
  select(-Generation, -`Type 2`, -Defense, -`Sp. Def`)

# select to remove columns with contains
df %>%
  filter(HP >= 100) %>%
  filter(Attack >= 100) %>%
  filter(Defense >= 100) %>%
  filter(Speed >= 100) %>%
  filter(`Sp. Atk` >= 100) %>%
  filter(`Sp. Def` >= 100) %>%
  filter(Generation < 3) %>%
  select(-contains("Type"), -contains("Def"))

# select range of columns
df %>%
  filter(HP >= 100) %>%
  filter(Attack >= 100) %>%
  filter(Defense >= 100) %>%
  filter(Speed >= 100) %>%
  filter(`Sp. Atk` >= 100) %>%
  filter(`Sp. Def` >= 100) %>%
  filter(Generation < 3) %>%
  select(Total:Speed)

# select() to reorder some columns
# get the rest with everything() 
# and then remove some other columns 
df %>%
  filter(HP >= 100) %>%
  filter(Attack >= 100) %>%
  filter(Defense >= 100) %>%
  filter(Speed >= 100) %>%
  filter(`Sp. Atk` >= 100) %>%
  filter(`Sp. Def` >= 100) %>%
  filter(Generation < 3) %>%
  select(Name, Total, `Type 1`, everything(), -`Type 2`, -`#`, -Generation)

# multiple conditions
df %>% 
  filter(HP >= 100 & Attack >= 100)

# arrange / sort 
## sort by type 1 ascending and then by Name descending
df %>%
  arrange(`Type 1`, desc(Name))

# dates
df2 <- read_csv('data/news.csv')
df2

df2 %>%
  filter(Date == min(Date))


# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
