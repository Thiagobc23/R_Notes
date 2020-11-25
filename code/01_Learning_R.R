# Author: Thiago Bernardes Carvalho
# Date: 11/19/2020

# Installing R
# https://github.com/genomicsclass/windows#installing-r

# Data Types, Structures, and Basic Operations
## Assigning values to variables
a <- 12
a

a <- 10.5
a

b <- 2
a-b

### sequences of numbers

c <- c(1, 2, 3, 4, 5) # c to concatenate or combine
print(c)

d <- 1:100
d <- 100:1
f <- seq(100)
f <- seq(0, 50, 5)

### math
c + 2 
c * 2
log(c)
log10(c)
c^2
sqrt(c)


## data types
a
typeof(a)

c
typeof(c)

d
typeof(d)

g <- "Is this data science?"
typeof(g)

h <- TRUE
typeof(h)

h <- F
typeof(h)

a
typeof(as.integer(a))

a <- "10.5"
typeof(a)
a <- as.double(a)
typeof(a)

## list like objects
c
is.vector(c)
b
is.vector(b)

j <- matrix(d, nrow = 10)
j

j <- matrix(d, nrow = 10, byrow=T)
j

is.vector(j)
is.matrix(j)

k <- array(c(1:24), c(4, 3, 2)) # numbers 1 to 24 in 4 rows, 3 columns, and two tables
k

name <- c("Jan", "Jim", "Joe")
age <- c(23, 75, 34)
winner <- c(T, F, F)

df <- cbind(name, age, winner) # all values to a single type
df
is.vector(df)
is.matrix(df)
is.data.frame(df)

df <- as.data.frame(cbind(name, age, winner)) # data frame
df
is.vector(df)
is.matrix(df)
is.data.frame(df)

j <- as.data.frame(j)
is.vector(j)
is.matrix(j)
is.data.frame(j)

l <- list(a, age, g, h, c) # can add almost anything to a list

as.data.frame(j)

## check field types
sapply(df, class)

# Packages

# https://www.r-project.org/ -> CRAN -> https://cloud.r-project.org/ ->
# Packages -> CRAN Task Views

## Installing package - Package Manager / Pacman
if(!require("pacman")) install.packages("pacman")

## Load packages with pacman
pacman::p_load(pacman, party, psych, rio, tidyverse)

## load base package
library(datasets)
?datasets
library(help = "datasets")

# import data
## Import csv with tidyverse
(df <- read_csv("data/MOCK_DATA.csv"))

## Import xlsx formats with rio
(df <- import("data/MOCK_DATA.xlsx") %>% as_tibble())

# Data Visualization
x = c(23,15,13,7,5,7,13,15,23)

## colors
barplot(x)
barplot(x, col = "blue4")
barplot(x, col = "#CC462E")
barplot(x, col = rgb(0, 0.6, 0))
barplot(x, col = c("#CC462E", "#2E86C1", "#138D75"))
barplot(x, col = heat.colors(9))
barplot(x, col = 1:5)
barplot(x, col = cm.colors(9))

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L

