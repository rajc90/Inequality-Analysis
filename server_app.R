library(dplyr)
library(reshape2)
library(ggplot2)
library(plotly)
data <- read.csv("inequality_data.csv") %>%
  rename("Year" = "ï..Year")



server <- function(input, output){
  output$by_state_inequality <- renderPlotly({
    by_state <- data %>%
      filter(st != 0) %>%
      group_by(State) %>%
      filter(State %in% c(input$state))
    
    by_state_plot <- ggplot(by_state, aes(Year), label = "Index") +
      geom_line(aes(y = Atkin05, color = "Atkin05")) +
      geom_line(aes(y = Gini, color = "Gini")) +
      geom_line(aes(y = Theil, color = "Theil")) +
      ylab("")
    ggplotly(by_state_plot)
  })
}
