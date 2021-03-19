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
      "This is a project that explores how inequality indicies have changed in 
      the USA from 1930 - 2015. The 'National Inequlity' tab explores how the change
      in equality indicies compared to the change in real GDP (a measure of economic
      growth). The 'Inequlity By State' shows how the indicies have changed by state
      as well as showing a comparison of selected indicies of two states in a given 
      year."
    ),
    
    p(id = "headers",
      "The three indicies being analyzed are: "),
    
    p(
      h5( id = "TheilHeader",
          "The Theil Index"),
    ),
    p("The Theil Index is a a type of general entropy measurement that has values 
      varying between perfect equality of 0, and perfectly inequal at infinity or 
      1 (depending on if it is normalized). These measurment can be decomposed by
      population groups or income sources. It essentially measures the distance a
      population is from state of everyone having the same income."),
    
    p(h5(id = "GiniHeader",
         "The Gini Index")),
    p("The Gini Coefficient was developed as a measure of
    economic inequality by measuring wealth distribution among a population (Dorfman).
    The value will range from 0 (perfect equality- every person has equal amount
    of income) to 1 (perfect inequality- one person has all the income) and if
    there is a value over 1 there are negative incomes . A higher 
    Gini Index means that there is greater inequality which means high income 
    individuals receiving a larger percentage of the total income. 
    A country will try to have a lower Gini because that means 
    there is not an overly unequal income across their population."),
    
    p(h5(id = "AtkinHeader",
         "The Atkin Index")),
    p("The Atkin Index represents percentage of total income a society has to forgo
      to have more equal shares of incomes between citizens. Measure depends on the 
      researchers, as they choose a theoretical parmenter whose value is societys willingness
      to accept smaller incomes for equal distribution. "),
    
    p(h5(id = "headers", "Data Source")),
    tags$a(href = "https://www.shsu.edu/eco_mwf/inequality.html", "View Source")
)

 