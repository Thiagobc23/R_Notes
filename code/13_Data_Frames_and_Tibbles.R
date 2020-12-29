# Data frames and Tibbles
library('tidyverse')

# data.frame is base R's standard tabular data format
# Tibble is tidyverse stardard tabular data format
# data.table is a highly optimized tabular format

# data frame
df <- read.csv('data/MOCK_DATA.csv')
df
class(df)

# tibble
my_tibble <- read_csv('data/MOCK_DATA.csv')
my_tibble
class(my_tibble)


# Data Frames:
## Base R
## Print don't give column information
## Print goes through a lot of records
## Converts Strings to Factors
### Class: data.frame

# Tibble
## Tidyverse
## Print output gives column information
## Print only the first 10 records
## Strings are kept strings
### Class: tbl_df tbl data.frame

# data frame group by
df %>%
  group_by(gender)

# tibble group by
my_tibble %>%
  group_by(gender)

## Both were converted to Tibbles
## Tidyverse will automatically convert data.frames to tibbles

# explicitly converting to tibble
df %>%
  as_tibble() %>%
  class()

## some older packages don't work with tibbles and require data.frames

# explicitly converting to data frame
my_tibble %>%
  as.data.frame() %>%
  class()

# select first column
df[,1] ## return a vector
df[[1]] ## return a vector
my_tibble[,1] ## return a tibble
my_tibble[[1]] ## return a vector

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
