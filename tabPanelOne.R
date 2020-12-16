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
  group_by(State) %>%
  filter(State %in% what_state) 

by_state_plot <- ggplot(by_state, aes(Year), label = "Index") +
  geom_line(aes(y = Atkin05, color = "Atkin05")) +
  geom_line(aes(y = Gini, color = "Gini")) +
  geom_line(aes(y = Theil, color = "Theil")) +
  ylab("")
ggplotly(by_state_plot)

## Panel 1 part 2