source("tabPanelOne.R")
source("tabPanelTwo.R")
source("introTab.R")
library(shiny)






navui <- fluidPage(
  includeCSS("style.css"),
  tags$h1(
    id = "website_title",
    "Analysis of Inequality Indicies in the USA, 1929 - 2015"
  ),
  navbarPage(
  "Analysis",
  intro,
  indicies_by_state,
  national_inquality_analysis
  )
)