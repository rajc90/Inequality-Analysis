library(dplyr)
library(reshape2)
library(ggplot2)
library(plotly)
data <- read.csv("inequality_data.csv") %>%
  rename("Year" = "ï..Year")
## This is panel 1 part 1
what_state <- c("Washington")

by_state <- data %>%
  filter(st != 0) %>%
  gather(-Year, -State, -st, -RMeanDev, key = "Index", value = "Value") %>%
  group_by(State) %>%
  filter(State %in% c(what_state))

by_state_plot <- ggplot(by_state, aes(x = Year, y = Value)) +
  geom_line(aes(color = Index))
ggplotly(by_state_plot)

## Panel 1 part 2
by_nation <- data %>%
  filter(st == 0) %>%
  filter(Year %in% c(2000:2013))
colnames(data)
