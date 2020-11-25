# Data Analysis

pacman::p_load(pacman, rio, tidyverse)

# data from: https://www.kaggle.com/unanimad/us-election-2020?select=president_county_candidate.csv
df <- import("data/president_county_candidate.csv") %>%
  print()

# summary stats - similar to pandas .describe()
summary(df)

# Frequencies with summary()
df <- mutate(df, name = as.factor(candidate)) # field as factor
summary(select(df, name))

# frequencies with table
table( select(df, candidate))

# tukey's five - Min, Lower-hinge, Median, upper-hinge, Max
fivenum(df$total_votes)

# boxplot stats (stats: hinges, n: count of values, conf: CI for median, out: outliers
boxplot.stats(df$total_votes)

# psych - describe()
p_load(psych)

describe(df)
describe(df$total_votes)

## data from : https://www.kaggle.com/karangadiya/fifa19
df <- import("data/fifa.csv") %>%
  print()

df <- select(df, Name, Age, Nationality, Height, Weight, Crossing:GKReflexes)
df

# Correlation
df %>%
  select(Crossing:GKReflexes) %>%
  cor(use = "complete.obs") %>%
  round(2)

cor.test(df$GKDiving, df$GKHandling)

# P-Value
p_load(Hmisc)

## omit NAs
new_df <- df %>%
  select(GKDiving:GKReflexes) %>%
  na.omit()

## correlation and p value 
new_df %>%
  as.matrix() %>%
  rcorr(type = "pearson")

## correlation and p value 
new_df %>%
  as.matrix() %>%
  rcorr(type = "spearman")

# linear regressions
plot(new_df)

new_df %>%
  select(GKPositioning, GKReflexes) %>%
  plot()

lm(new_df$GKReflexes ~ new_df$GKPositioning) %>%
  abline()

fit_model <- lm(new_df$GKReflexes ~ new_df$GKPositioning)
fit_model

summary(fit_model)

confint(fit_model) # confidence interval

predict(fit_model) # predict all GKReflexes

lm.influence(fit_model)
influence.measures(fit_model)

# multiple regression
## Select columns so that the 'outcome/ y' variable is in the first column
new_df <- df %>%
  select(Finishing, Crossing, HeadingAccuracy:GKReflexes) %>%
  na.omit()

new_df

fit2 <- lm(new_df)

summary(fit2)

# contingency table
ct <- table(df$Nationality,df$Age)
ct

p_load(magrittr)

## Row %
ct %>%
  prop.table(1) %>%
  round(2) %>%
  multiply_by(100)

## Column %
ct %>%
  prop.table(2) %>%
  round(2) %>%
  multiply_by(100)

## Total %
ct %>%
  prop.table() %>%
  round(2) %>%
  multiply_by(100)

# Chi-Squared Test

chi <- chisq.test(ct)
chi

chi$observed
chi$expected
chi$residuals
chi$stdres


################################################################################
# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L

