# Groups - Tidyverse

library("tidyverse")

## read csv
df <- read_csv('data/Pokemon.csv')
df

# group data
grouped_df <- df %>%
  group_by(`Type 1`, `Type 2`) %>%
  select(Name, `Type 1`, `Type 2`, Total)

# calculate the percentage of the 'Total' 
# each record represents for that group
grouped_df %>%
  mutate(group_total = sum(Total))

# calculate the percentage of the 'Total' 
# each record represents for that group
grouped_df %>%
  mutate(group_total = sum(Total),
         percent_total = 100 * Total/ sum(Total)) %>%
  view()

# ungrouping
grouped_df %>%
  mutate(group_total = sum(Total),
         percent_total = 100 * Total/ sum(Total)) %>%
  ungroup()

# n / count records
grouped_df %>%
  mutate(group_total = sum(Total),
         percent_total = 100 * Total/ sum(Total),
         group_records = n()) %>%
  ungroup()

# distinct
grouped_df %>%
  mutate(group_total = sum(Total),
         group_records = n()) %>%
  select(-Name, -Total) %>%
  distinct() %>%
  ungroup() %>%
  arrange(`Type 1`, `Type 2` ) %>%
  view()

# unique
grouped_df %>%
  mutate(group_total = sum(Total),
         group_records = n()) %>%
  select(-Name, -Total) %>%
  unique() %>%
  ungroup() %>%
  arrange(`Type 1`, `Type 2` ) %>%
  view()

# number of groups
grouped_df %>%
  n_groups()

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
