source("tabPanelOne.R")

library(shiny)


indicies_by_state




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