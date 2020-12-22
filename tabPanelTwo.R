library(dplyr)
library(reshape2)
library(ggplot2)
library(plotly)
data <- read.csv("inequality_data.csv") %>%
  rename("Year" = "ï..Year")
usa_data <- data %>%
  filter(st == 0) %>%
  filter(Year > 2000)
output$nation_ineqality <- renderPlotly({
  by_nation <- data %>%
    filter(st == 0) %>%
    gather(-Year, -State, -st, -RMeanDev, key = "Index", value = "Value") %>%
    filter(Index %in% c(input$index_typep1_2))
  
  
  nation_plot <- ggplot(by_nation, aes(x = Year, y = Value)) +
    geom_line(aes(color = Index)) +
    ylab("")
  ggplotly(nation_plot)