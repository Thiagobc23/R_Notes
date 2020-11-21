## bar chart
pacman::p_load(pacman, tidyverse)

diamonds

plot(diamonds$color)

diamonds %>%
  select(color) %>%
  plot()
####################################

### BAR CHART ###
diamonds %>%
  select(cut) %>%
  table() %>%
  sort(decreasing = T) %>%
  barplot(
    main = "My title",
    sub = "text under the plot - (source)",
    horiz = T, # barh
    xlab = "my x label",
    ylab = "my y label",
    xlim = c(0, 25000),
    border = T,
    col = "#CC462E"
  )

### STACKED BAR CHART ###
df <- diamonds %>%
  select(color, cut) %>%
  table() %>%
  print()

df %>%
  barplot(
    legend = rownames(.),
    col = heat.colors(7)
    )

### CLUSTERED BAR CHART ###
df %>%
  barplot(
    legend = rownames(.),
    beside = T)

### HISTOGRAM ###
diamonds$price %>%
  hist(breaks = 7, # bins
       main = "My title",
       sub = "text under the plot",
       ylab = "y label - Frequency",
       xlab = "x label - Selected field",
       border = NA,
       col = '#CC462E')

### BOX PLOT ###

## single
diamonds %>%
  select(price) %>%
  boxplot(
    horizontal = T, # sideways
    notch = T,
    main = "My title",
    sub = "text bellow the plot",
    xlab = "x label",
    col = "#546D71"
  )

.## group
diamonds %>%
  select(cut, price) %>%
  boxplot(
    price ~ cut,
    data = . ,
    notch = T,
    main = "My title",
    sub = "text bellow the plot",
    xlab = "x label",
    ylab = "ylabel - price",
    col = c("#546D71", "#565471", "#715D54", "#677154", "#547157")
  )

### SCATTER PLOT ###

## multiple
diamonds %>%
  select(depth:price) %>%
  plot()

?pch

## single
diamonds %>%
  select(depth,price) %>%
  plot(
    main = "My title",
    sub = "text bellow the plot",
    xlab = "x label - depth",
    ylab = "ylabel - price",
    col = "#547157",
    pch = 10 # marker
  )

## linear regression
x <- c(23, 27, 34, 15, 42, 45, 16, 60, 79, 78, 69)
y <- c(100, 103, 120, 80, 134, 137, 81, 159, 180, 176, 170)

df <- as.data.frame(cbind(x, y)) # data frame
df

plot(df)

df %>%
  lm(y ~ x, data = .) %>%
  abline() 

### LINE CHARTS ###

library(datasets)

uspop %>% # time series dataset
  plot(
    main = "My title",
    sub = "text bellow the plot",
    xlab = "x label",
    ylab = "ylabel - price",
    col = c("#546D71")
    )

## draw vertical lines
abline(v = 1860)
text(1860, 50, "1860")
abline(v = 1945)
text(1945, 50, "1945")

## Multiple charts/ lines
EuStockMarkets

plot(EuStockMarkets)
ts.plot(EuStockMarkets)

### HIERARCHICAL CLUSTERS ### 

y <- c("yellow", "yellow", "blue", "blue", "blue", "red",
       "red", "yellow", "yellow", "red", "red", "red")

z <- c("blue", "red", "blue", "blue", "blue", "red",
       "red", "red", "red", "red", "red", "red")

df <- as.data.frame(cbind(x, y, z)) # data frame
df

clusters <- df %>%
  dist %>%
  hclust

clusters %>%
  plot(labels = df$y)

clusters %>%
  rect.hclust(k = 5, border = "grey")


# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
