library(dplyr)
library(reshape2)
library(ggplot2)
library(plotly)
library(tidyr)
data <- read.csv("inequality_data.csv") %>%
  rename("Year" = "ï..Year")



server <- function(input, output){
##Page one of the UI
  output$by_state_inequality <- renderPlotly({
    x <- input$startyear1_1
    y <- input$endyear1_1
    
    by_state <- data %>%
      filter(st != 0) %>%
      gather(-Year, -State, -st, -RMeanDev, key = "Index", value = "Value") %>%
      group_by(State) %>%
      filter(State %in% c(input$state)) %>%
      filter(Index %in% c(input$index_typep1_1)) %>%
      filter(Year %in% c(x:y))
    

    by_state_plot <- ggplot(by_state, aes(x = Year, y = Value)) +
      geom_line(aes(color = Index)) +
      ylab("")
    ggplotly(by_state_plot)
  })
  output$state_comparison <- renderPlotly({
    
    a <- input$startyear1_2
    b <- input$endyear1_2
    
    by_state_comparison <- data %>%
      filter(st != 0) %>%
      gather(-Year, -State, -st, -RMeanDev, key = "Index", value = "Value") %>%
      group_by(State) %>%
      filter(State %in% c(input$state1, input$state2)) %>%
      filter(Year %in% c(a:b))
    
    plot_2 <- ggplot(data = by_state_comparison, aes(x = Year, y = Value)) +
      geom_bar(aes(fill = Index), position = "dodge", stat = "identity") +
      facet_wrap(~State) +
      ggtitle(paste("Comparing", input$state1,"&", input$state2,
                    "between years", input$startyear1_2, "&", input$endyear1_2))
    ggplotly(plot_2)
  })
  
##Page two of the UI 
    output$nation_ineqality <- renderPlotly({
      by_nation <- data %>%
        filter(st == 0) %>%
        gather(-Year, -State, -st, -RMeanDev, key = "Index", value = "Value") %>%
        filter(Index %in% c(input$index_typep1_2))
      
      
      nation_plot <- ggplot(by_nation, aes(x = Year, y = Value)) +
        geom_line(aes(color = Index)) +
        ylab("")
      ggplotly(nation_plot)

  })
}
