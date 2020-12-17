source("tabPanelOne.R")

library(shiny)
dashui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

indicies_by_state <- tabPanel(
  "Inequality By State",
  sidebarLayout(
    sidebarPanel(
      helpText("Make sure to spell state name correctly"),
      selectInput(
        inputId = "state",
        label = "Choose state to analyze",
        choices = unique(data$State),
        selected = "Alabama"
      ),
      sliderInput(
        inputId = "yearpt1_1",
        label = "Select Year Range",
        min = min(data$Year),
        max = max(data$Year),
        sep = "",
        value = max(data$Year),
        round = TRUE
      ),
      radioButtons(
        inputId = "index_typep1_1",
        "Choose Index:",
        choices = c(
          "Theil" = "Theil",
          "Gini" = "Gini",
          "Atkin" = "Atkin05"
        )
      )
    ),
    mainPanel(
      plotlyOutput("by_state_inequality")
    )
  )
)




navui <- navbarPage(
  "Inequality Index",
  indicies_by_state
)
