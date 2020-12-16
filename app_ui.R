source("analysis.R")

library(shinydashboard)
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
