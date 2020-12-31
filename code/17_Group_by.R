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

# Running Total
library(readxl)

## read file
ts <- read_excel('raw_data/timeseries.xlsx')

# calculate cumsum - Cummulative Sum / Running Total
### DATA MUST BE SORTED ###
ts <- ts %>%
  mutate(running_total = cumsum(Value))

# visualize
ts %>%
ggplot(aes(x = Date, y = running_total))+
  geom_line()

# BAD EXAMPLE - Arranging the data by Value
ts %>%
  arrange(Value)  %>%
  mutate(running_total = cumsum(Value)) %>%
  ggplot(aes(x = Date, y = running_total))+
  geom_line()


# Running total by group
ts <- ts %>%
  group_by(Category) %>%
  mutate(running_total = cumsum(Value))

ts %>%
  ggplot(aes(x = Date, y = running_total, color = Category))+
  geom_line()

# Running Average by group
ts <- ts %>%
  group_by(Category) %>%
  mutate(running_mean = cummean(Value))

ts %>%
  ggplot(aes(x = Date, y = running_mean, color = Category))+
  geom_line()

# quantile
quantile(ts$Value)

## read file
ts <- read_excel('raw_data/timeseries.xlsx')

# cumany - check records after some event
ts %>%
  group_by(Category) %>%
  mutate(running_mean = cummean(Value)) %>%
  filter(cumany(Value > 11)) %>%
  summarise(after_peak = n()) %>%
  ggplot(aes(x=Category, y = after_peak)) +
  geom_col()

# cumany - check records before some event
ts %>%
  group_by(Category) %>%
  mutate(running_mean = cummean(Value)) %>%
  filter(cumall(Value < 11)) %>%
  summarise(before_peak = n()) %>%
  ggplot(aes(x=Category, y = before_peak)) +
  geom_col()

# summarise
df %>%
  group_by(`Type 1`) %>%
  select (Name: Speed, -`Type 2`) %>%
  summarise(observations = n(), 
            total_atk = sum(Attack),
            avg_def = mean(Defense))

# summarise all
## need to select only numeric values
df %>%
  group_by(`Type 1`) %>%
  select (Total: Speed,) %>%
  summarise_all(mean)

# summarise if
## can add a condition to select only numerical values
df %>%
  group_by(`Type 1`) %>%
  select (Name: Speed, -`Type 2`) %>%
  summarise_if(is.numeric, mean)

# remember to ungroup
new_df <- df %>%
  group_by(`Type 1`) %>%
  select (Name: Speed, -`Type 2`) %>%
  summarise_if(is.numeric, mean) %>%
  ungroup()

new_df


# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L

