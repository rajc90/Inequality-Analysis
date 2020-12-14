library(dplyr)
library(reshape2)
library(ggplot2)
library(plotly)
data <- read.csv("inequality_data.csv")

what_state <- c("Washington")
by_state <- data %>%
  rename("Year" = "ï..Year") %>%
  group_by(State) %>%
  filter(State %in% what_state) 

by_state_plot <- ggplot(by_state, aes(Year),
                        text = paste("Atkin05:", Atkin05, "<br>",
                                     "Gini:", Gini, "<br>",
                                     "Theil:", Theil, "<br>",)) +
  geom_line(aes(y = Atkin05, color = "Atkin05")) +
  geom_line(aes(y = Gini, color = "Gini")) +
  geom_line(aes(y = Theil, color = "Theil")) +
  ylab("")
ggplotly(by_state_plot)
