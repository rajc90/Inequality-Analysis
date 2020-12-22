library(dplyr)
library(reshape2)
library(ggplot2)
library(plotly)
library(tidyr)
data <- read.csv("inequality_data.csv") %>%
  rename("Year" = "ï..Year")

indicies_by_state <- tabPanel(
  "Inequality By State",
  tags$style(
    ".navbar-nav li a {
        font-size: 20px;
        font-weight: bold;
        font-color: #f1f6f9;
      }
    "
  ),
  tags$body(
    h1(
      id = "headers",
      "Tracking Inequality Indicies of Selected State"
    ),
    sidebarLayout(
      sidebarPanel(
        selectInput(
          inputId = "startyear1_1",
          label = "Choose start year",
          choices = unique(data$Year),
          selected = "1930"
        ),
        selectInput(
          inputId = "endyear1_1",
          label = "Choose start year",
          choices = unique(data$Year),
          selected = "2015"
        ),
        selectInput(
          inputId = "state",
          label = "Choose state to analyze",
          choices = unique(data$State),
          selected = "New York"
        ),
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
        selectInput(
          inputId = "state1",
          label = "Choose first state",
          choices = unique(data$State),
          selected = "Alabama"
        ),
        selectInput(
          inputId = "state2",
          label = "Choose second state",
          choices = unique(data$State),
          selected = "Washington"
        ),
        selectInput(
          inputId = "startyear1_2",
          label = "Choose start year",
          choices = unique(data$Year),
          selected = "2008"
        ),
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


