library(dplyr)
library(reshape2)
library(ggplot2)
library(plotly)
data <- read.csv("inequality_data.csv") %>%
  rename("Year" = "ï..Year")


# The trial functions for tab Panel One
#### This is panel 1 part 1
what_state <- c("Washington", "Utah")
state2 <- c("Alabama", "Utah")
x <- 2008
y <- 2010
by_state <- data %>%
  filter(st != 0) %>%
  gather(-Year, -State, -st, -RMeanDev, key = "Index", value = "Value") %>%
  group_by(State) %>%
  filter(State %in% c(what_state)) %>%
  filter(Year %in% c(x:y))

by_state_plot <- ggplot(by_state, aes(x = Year, y = Value)) +
  geom_line(aes(color = Index)) + facet_grid(~State) +
  scale_x_discrete()
ggplotly(by_state_plot)

#### Panel 1 part 2


ggplot(data = by_state, aes(x = Year, y = Value)) +
  geom_bar(aes(fill = Index), position = "dodge", stat = "identity") +
  facet_wrap(~State)




# Trial functions for Panel 1 part 1
####
by_nation <- data %>%
filter(st == 0) %>%
  gather(-Year, -State, -st, -RMeanDev, key = "Index", value = "Value") %>%
  filter(Year %in% c(2000:2013))
colnames(data)






data %>%
  filter(Year == 2007) %>%
  arrange(desc(Gini)) %>%
  top_n(1)
  
  