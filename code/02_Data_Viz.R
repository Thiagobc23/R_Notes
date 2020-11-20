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
    col = #CC462E
  )

### STACKED BAR CHART ###
df <- diamonds %>%
  select(color, cut) %>%
  table() %>%
  print()

df %>%
  barplot(legend = rownames(.))

### CLUSTERED BAR CHART ###
df %>%
  barplot(
    legend = rownames(.),
    beside = T)

