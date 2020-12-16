library(dplyr)
library(reshape2)
library(ggplot2)
library(plotly)
data <- read.csv("inequality_data.csv") %>%
  rename("Year" = "ï..Year")



# what_index <- c("Theil")
# by_index <- data %>%
#   group_by(what_index)


unique(data$State)


  
  