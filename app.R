library(shiny)
source("app_ui.R")
source("server_app.R")

shinyApp(ui = navui, server = server)

