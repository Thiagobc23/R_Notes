# Dates and Strings
library('tidyverse')

df <- read_csv('data/fifa.csv')
df

# get year of birth with age
years <- select(df, Age) - 2018
years <- years * -1

# lib to help with dates
library(lubridate)

# create a columns with YOB
df <- df %>%
  mutate(YOB = years)

df$YOB

# ymd - year month day function returns a date from a string

# create a columns with YOB as Date
df <- df %>%
  mutate(YOB = ymd(paste0((Age-2018)*-1, "-01-01")))

df$YOB

# https://www.rdocumentation.org/packages/tidyr/versions/0.8.3/topics/separate
# separate names - merge extra
df %>%
  select(Name) %>%
  separate(Name, c('First', 'Last'), sep=' ', extra = "merge")

# separate names - drop extra
df %>%
  select(Name) %>%
  separate(Name, c('First', 'Last'), sep=' ', extra = "drop")

# separate names - warning and drop extra (Default)
df %>%
  select(Name) %>%
  separate(Name, c('First', 'Last'), sep=' ', extra = "warn")

# separate names - fill with missing values on left
df %>%
  select(Name) %>%
  separate(Name, c('First', 'Last'), sep=' ', 
           extra = "merge", fill='left') %>%
  slice(c(84, 87, 91, 92, 103))

# separate names - warning 
# and fill with missing values on right (Default)
df %>%
  select(Name) %>%
  separate(Name, c('First', 'Last'), sep=' ', 
           extra = "merge", fill='warn') %>%
  slice(c(84, 87, 91, 92, 103))

# slice - get values by index
df %>%
  select(Name) %>%
  slice(c(100,200,300))


# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
