# Groups - Tidyverse

library("tidyverse")

df <- read_csv('data/spotify.csv') %>%
  rename(genre = `top genre`)

df

# group by genre
df %>%
  group_by(genre)

# mutate without grouping
df %>%
  mutate(mean_bpm = (bpm - mean(bpm))^2) %>%
  select(genre, mean_bpm)

# mutate with grouping
df %>%
  group_by(genre) %>%
  mutate(mean_bpm = (bpm - mean(bpm))^2) %>%
  select(genre, mean_bpm)

# summarise without grouping
df %>%
  summarise(summary = mean(bpm))

# summarise with grouping
df %>%
  group_by(genre) %>%
  summarise(mean_bpm = mean(bpm))

# ungroup
df %>%
  group_by(genre) %>%
  mutate(mean_bpm = mean(bpm) %>%
  select(genre, mean_bpm) %>%
  mutate(my_grouped_sum = sum(mean_bpm)) %>%
  ungroup() %>%
  mutate(my_regular_sum = sum(mean_bpm))

# multiple fields
df %>%
  group_by(genre, year) %>%
  summarise(rec_count = n()) %>%
  arrange(desc(year), desc(rec_count))

# multiple fields
df %>%
  group_by(genre, year) %>%
  summarise(genre_year_count = n()) %>%
  arrange(desc(year), desc(genre_year_count)) %>%
  mutate(genre_count = n()) %>%
  ungroup() %>%
  mutate(total_count = n())

# multiple fields - subsequent
df %>%
  group_by(genre) %>%
  mutate(mean_bpm_genre = mean(bpm)) %>%
  group_by(year, add = TRUE) %>%
  mutate(mean_bpm_genre_year = mean(bpm)) %>%
  select(genre, year, mean_bpm_genre, mean_bpm_genre_year)

df         
# multiple fields - wrong
df %>%
  group_by(genre) %>%
  group_by(year) %>%
  summarise(rec_count = n()) %>%
  arrange(desc(year), desc(rec_count))


# function - wrong
my_func <- function(df, group){
  df %>%
    group_by(group) %>%
    summarise(my_count = n()) %>%
    arrange(desc(my_count))
}
my_func(df, 'year')

# function - quosure
my_func <- function(df, group){
  df %>%
    group_by(!!group) %>%
    summarise(my_count = n()) %>%
    arrange(desc(my_count))
} 
my_group = quo(year)
my_func(df, my_group)

# function - group_by_
my_func <- function(df, group){
  df %>%
    group_by_(group) %>%
    summarise(my_count = n()) %>%
    arrange(desc(my_count))
}
my_func(df, 'genre')

# group_by_all
new_df <- select(df, genre, year)

new_df %>%
  group_by_all() %>%
  summarise(my_cnt = n()) %>%
  arrange(desc(my_cnt))

new_df %>%
  group_by(across()) %>%
  summarise(my_cnt = n()) %>%
  arrange(desc(my_cnt))

# group_by_if
new_df <- df %>%
  mutate(artist = as.factor(artist),
         genre = as.factor(genre))

new_df %>%
  group_by_if(is.factor) %>%
  summarise(my_cnt = n()) %>%
  arrange(desc(my_cnt))

new_df %>%
  group_by(across(where(is.factor))) %>%
  summarise(my_cnt = n()) %>%
  arrange(desc(my_cnt))

# group columns where any value contains 'dance'  
new_df %>%
  group_by_if(function(x) any(grepl("dance", x, fixed=TRUE))) %>%
  summarise(my_cnt = n())

# split
df_list <- df %>%
  group_by(year) %>%
  group_split()

df_list[[10]]

df_list[[10]] %>%
  select(year) %>%
  unique()

# nest 
df_nest <- df %>%
  group_nest(genre, year)

df_nest

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
