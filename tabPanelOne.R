library(dplyr)
library(reshape2)
library(ggplot2)
library(plotly)
data <- read.csv("inequality_data.csv") %>%
  rename("Year" = "ï..Year")
## This is panel 1 part 1
what_state <- c("Washington", "Alabama")

by_state <- data %>%
  filter(st != 0) %>%
  gather(-Year, -State, -st, -RMeanDev, key = "Index", value = "Value") %>%
  group_by(State) %>%
  filter(State %in% c(what_state))

by_state_plot <- ggplot(by_state, aes(x = Year, y = Value)) +
  geom_line(aes(color = Index)) + facet_grid(~State)
ggplotly(by_state_plot)

## Panel 1 part 2
by_nation <- data %>%
  filter(st == 0)
colnames(data)



indicies_by_state <- tabPanel(
  "Inequality By State",
  tags$body(
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
        plotlyOutput("by_state_inequality", width = "100%")
      )
    ),
  ),
  p(),
  p(),
  p(),
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


