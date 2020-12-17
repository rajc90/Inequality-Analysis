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
      plotlyOutput("by_state_inequality")
    )
  )
)




navui <- navbarPage(
  "Inequality Index",
  indicies_by_state
)
