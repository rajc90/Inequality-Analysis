library(dplyr)
library(reshape2)
library(ggplot2)
library(plotly)
data <- read.csv("inequality_data.csv") %>%
  rename("Year" = "ï..Year")
usa_data <- data %>%
  filter(st == 0) %>%
  filter(Year > 2000)

national_inquality_analysis <- tabPanel(
  "National Analysis",
  # Styles the navbar text
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
      "Tracking Inequality Indicies of the USA"
    ),
    sidebarLayout(
      sidebarPanel(
        #Choose the start year for analysis
        selectInput(
          inputId = "startyear2_1",
          label = "Choose start year",
          choices = unique(data$Year),
          selected = "1930"
        ),
        #Choose the end year for analysis
        selectInput(
          inputId = "endyear2_1",
          label = "Choose start year",
          choices = unique(data$Year),
          selected = "2015"
        ),
        #Choose the index to be analyzed
        checkboxGroupInput(
          inputId = "index_typep2_1",
          "Choose Index:",
          choices = c(
            "Theil" = "Theil",
            "Gini" = "Gini",
            "Atkin" = "Atkin05"),
          selected = c("Theil")
        )
      ),
      mainPanel(
        plotlyOutput("nation_ineqality", width = "100%")
      ),
    ),
  )
)