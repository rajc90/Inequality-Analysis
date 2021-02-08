library(dplyr)
library(reshape2)
library(ggplot2)
library(plotly)
library(shiny)

data <- read.csv("inequality_data.csv") %>%
  rename("Year" = "ï..Year")

gdp <- read.csv("GDP.csv") %>%
  rename("Year" = "ï..Year") %>%
  filter(Year %in% c(1929:1945)) %>%
  gather(key = "Type", value = "GDP", -Year)

gdp_plot <- ggplot(data = gdp, aes(x=Year, y=GDP)) +
  geom_line()+
  geom_point() +
  ylab("GDP (in Trillions)")
ggplotly(gdp_plot)



national_inquality_analysis <- tabPanel(
  "National Analysis",
  # Styles the navbar text
  tags$style(),
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
      ),
      mainPanel(),
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
  ),
   tags$body(
     h1(
       id = "headers",
       "Tracking Economic Growth (GDP) in the US"
       ),
     sidebarLayout(
      sidebarPanel(
        #Choose the start year for analysis
        selectInput(
          inputId = "startyear2_2",
          label = "Choose start year",
          choices = unique(data$Year),
          selected = "1930"
        ),
        #Choose the end year for analysis
        selectInput(
          inputId = "endyear2_2",
          label = "Choose start year",
          choices = unique(data$Year),
          selected = "2015"
        )
      ),
      mainPanel(
        plotlyOutput("nation_GDP")
      )
    )
  )
)
