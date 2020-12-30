# importing files with tidyverse

library(tidyverse)
library(readxl)

# read xl
df <- read_excel('raw_data/MOCK_DATA.xlsx')
df

# select sheet
df <- read_excel('raw_data/MOCK_DATA.xlsx',
                 sheet = 'winners')
df

# select range
df <- read_excel('raw_data/MOCK_DATA.xlsx',
                 sheet = 'abc',
                 range = 'B2:F9')
df

# skip rows
df <- read_excel('raw_data/MOCK_DATA.xlsx',
                 sheet = 'abc',
                 skip = 1)
df

## fix names
colnames(df) <- make.names(colnames(df))
colnames(df)

# select columns
df <- read_excel('raw_data/MOCK_DATA.xlsx',
                 sheet = 'winners',
                 range = cell_cols('A:C'))
df

## write CSV
write_csv(df, file = "data/random_names.csv")

# read csv - baseR
read.csv('data/MOCK_DATA.csv')

## skip rows
read.csv('data/random_names.csv', skip=5)

## this is a data frame
class(read.csv('data/MOCK_DATA.csv'))

# read csv - readr
read_csv('data/MOCK_DATA.csv')
class(read_csv('data/MOCK_DATA.csv'))

# read json
library(jsonlite)

df <- fromJSON("data/MOCK_DATA.json")
df

# read rdata
load(file = "data/Pokemon.rdata")

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
