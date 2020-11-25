# Data Wrangling

pacman::p_load(pacman, rio, tidyverse)

# data from: https://www.kaggle.com/unanimad/us-election-2020?select=president_county_candidate.csv
df <- import("data/president_county_candidate.csv") %>%
  print()

# filter
df %>%
  filter(total_votes > 1000000)

filter(df, county == "Los Angeles County")

filter(df, state == "Florida" & candidate == "Joe Biden" & won == TRUE)

filter(df, state == "Florida" & !candidate == "Joe Biden" & won == TRUE)

# recode
mutate(df, name = recode(candidate, 
                     "Donald Trump" = "Trump",
                     "Joe Biden" = "Biden",
                     .default = "Others"))

# case_when

new_df <- mutate(df, bidenWon = case_when(candidate == 'Joe Biden' & won == TRUE ~ "yes", 
                                TRUE ~ "no")) 

# arrange
new_df <- filter(new_df, bidenWon == 'yes' & total_votes > 100000)

arrange(new_df, desc(total_votes))

# Aggregating
mutate(df, votes_times_two = total_votes + total_votes)

mutate(df, votes_temp = total_votes * 3 / 5)

mutate(df, votes_temp = (total_votes * 2) + (total_votes * -1))




# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L

