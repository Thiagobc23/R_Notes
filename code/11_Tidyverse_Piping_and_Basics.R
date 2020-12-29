# Tidyverse

# load plyr before tidyverse to avoid conflicts between plyr and dplyr
library(plyr)
library(tidyverse)

tidyverse_update() # update package
## development versions can be found at github

## some packages will have conflicts
## we can specify the package when calling a function in those cases
stats::filter()

# Another approach is to avoid conflicts is not to load plyr
# and use it's functions by typing its name first
plyr::mapvalues()

# pipes
## pipes are used for readability
data <- c(1,1,2,4,6)

## this
diff(data)
## is the same as this
data %>%
  diff()

# again

## this
mean(diff(data))
## is the same as this but with pipes
data %>%
  diff() %>%
  mean()

## another example of pipes
library(praise)

# this works
rep(praise(), mean(diff(data)))

# this doesn't
data %>%
  diff() %>%
  mean() %>%
  rep(praise())

# a dot (.) can be used to hold tell R where to put the previous parameter
data %>%
  diff() %>%
  mean() %>%
  rep(praise(), .)

# more examples
midwest %>%
  select(area) 

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
