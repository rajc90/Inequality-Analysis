library(dplyr)
library(reshape2)
library(ggplot2)
library(plotly)
library(tidyr)
library(shiny)

intro <- tabPanel(
    "Dashboard Overview",
    h3(
      id = "headers",
      "3 inequality indicies will be tracked"
    ),
    h5( id = "TheilHeader",
      "The Theil Index"),
    p(),
    h5(id = "GiniHeader",
       "The Gini Index"),
    p(),
    h5(id = "AtkinHeader",
      "The Atkin Index"),
    p(),
)

 