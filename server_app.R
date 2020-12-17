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
    
    date_range <- input$yearpt1_1
    
    if(input$index_typep1_1 == "Theil"){
      by_state_plot <- ggplot(by_state, aes(date_range), label = "Index") +
        geom_line(aes(y = Theil, color = "Theil")) +
        ylab("")
      return(ggplotly(by_state_plot))
    } else if(input$index_typep1_1 == "Gini"){
      by_state_plot <- ggplot(by_state, aes(date_range), label = "Index") +
        geom_line(aes(y = Gini, color = "Gini")) +
        ylab("")
      return(ggplotly(by_state_plot))
    } else if(input$index_typep1_1 == "Atkin05"){
      by_state_plot <- ggplot(by_state, aes(date_range), label = "Index") +
        geom_line(aes(y = Atkin05, color = "Atkin05")) +
        geom_line(aes(y = Gini, color = "Gini")) +
        geom_line(aes(y = Theil, color = "Theil")) +
        ylab("")
      return(ggplotly(by_state_plot))
    } else {
      by_state_plot <- ggplot(by_state, aes(date_range), label = "Index") +
        geom_line(aes(y = Atkin05, color = "Atkin05")) +
        geom_line(aes(y = Gini, color = "Gini")) +
        geom_line(aes(y = Theil, color = "Theil")) +
        ylab("")
      return(ggplotly(by_state_plot))
    }
    
  })
}
