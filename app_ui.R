source("tabPanelOne.R")

library(shiny)


indicies_by_state <- tabPanel(
  "Inequality By State",
  tags$style(
    ".navbar-nav li a {
        font-size: 20px;
        font-weight: bold;
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
        tags$style(".well {background-color:yellow;}"),
        selectInput(
          inputId = "state",
          label = "Choose state to analyze",
          choices = unique(data$State),
          selected = "Alabama"
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
    "Tracking Inequality Indicies of the USA"
    ),
  tags$body(
    sidebarLayout(
      sidebarPanel(
        checkboxGroupInput(
          inputId = "index_typep1_2",
          "Choose Index:",
          choices = c(
            "Theil" = "Theil",
            "Gini" = "Gini",
            "Atkin" = "Atkin05"),
          selected = c("Theil")
        )
      ),
      mainPanel(
        plotlyOutput("nation_ineqality")
      )
    )
  )
)




navui <- fluidPage(
  includeCSS("style.css"),
  tags$h1(
    id = "website_title",
    "Analysis of Inequality Indicies in the USA, 1929 - 2015"
  ),
  navbarPage(
  "Analysis",
  indicies_by_state
  )
)