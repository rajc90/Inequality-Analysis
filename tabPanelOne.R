library(dplyr)
library(reshape2)
library(ggplot2)
library(plotly)
library(tidyr)
library(shiny)

#The data needs to be filtered because of the year column in the data
data <- read.csv("inequality_data.csv") %>%
  rename("Year" = "ï..Year")


indicies_by_state <- tabPanel(
  "Inequality By State",
  # This is to style the font in the navbar
  tags$body(
    h1(
      id = "headers",
      "Tracking Inequality Indicies of Selected State"
    ),
    sidebarLayout(
      sidebarPanel(
        # Input to choose the start year for analysis
        selectInput(
          inputId = "startyear1_1",
          label = "Choose start year",
          choices = unique(data$Year),
          selected = "1930"
        ),
        # Input to choose the end year for analysis
        selectInput(
          inputId = "endyear1_1",
          label = "Choose start year",
          choices = unique(data$Year),
          selected = "2015"
        ),
        # What state the user can analyze
        selectInput(
          inputId = "state",
          label = "Choose state to analyze",
          choices = unique(data$State),
          selected = "New York"
        ),
        # Allows the user to choose which index is displayed
        checkboxGroupInput(
          inputId = "index_typep1_1",
          "Choose Index:",
          choices = c(
            "Theil" = "Theil",
            "Gini" = "Gini",
            "Atkin" = "Atkin05"),
          selected = c("Theil")
        )
      ),
      mainPanel(
        plotlyOutput("by_state_inequality", width = "100%")
      ),
    ),
  ),
  h1(
    id = "headers",
    "Compare Indicies by State"
  ),
  tags$body(
    sidebarLayout(
      sidebarPanel(
        tags$style(".well {background-color: #f5f5f5;}"),
        # Input to choose the first state for comparison
        selectInput(
          inputId = "state1",
          label = "Choose first state",
          choices = unique(data$State),
          selected = "Alabama"
        ),
        # Input to choose the second state for comparison
        selectInput(
          inputId = "state2",
          label = "Choose second state",
          choices = unique(data$State),
          selected = "Washington"
        ),
        # Input to choose the start year for analysis
        selectInput(
          inputId = "startyear1_2",
          label = "Choose start year",
          choices = unique(data$Year),
          selected = "2008"
        ),
        # Input to choose the end year for analysis
        selectInput(
          inputId = "endyear1_2",
          label = "Choose start year",
          choices = unique(data$Year),
          selected = "2010"
        )
      ),
      mainPanel(
        plotlyOutput("state_comparison")
      )
    )
  )
)


