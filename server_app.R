library(dplyr)
library(reshape2)
library(ggplot2)
library(plotly)
library(tidyr)
data <- read.csv("inequality_data.csv") %>%
  rename("Year" = "ï..Year")



server <- function(input, output){

  output$by_state_inequality <- renderPlotly({
    by_state <- data %>%
      filter(st != 0) %>%
      gather(-Year, -State, -st, -RMeanDev, key = "Index", value = "Value") %>%
      group_by(State) %>%
      filter(State %in% c(input$state)) %>%
      filter(Index %in% c(input$index_typep1_1))
    

    by_state_plot <- ggplot(by_state, aes(x = Year, y = Value)) +
      geom_line(aes(color = Index)) +
      ylab("")
    ggplotly(by_state_plot)

  })
}
