remove(list=ls())

library(shiny)
library(tidyverse)
library(janitor)

data <- 
  read_csv(here("data/interim/broughton_archipelago/BA_data_2016_to_2020.csv")) %>%
  clean_names()

all_species <- data %>%
  select(fish_species) %>%
  distinct() %>%
  drop_na()

# ui portion

ui <- fluidPage(
  selectInput(
    inputId = "fish_species",
    label = "Fish species:",
    choices = all_species
  ),
  submitButton(
    text = "Refresh my plot"
  ),
  plotOutput(outputId = "sea_lice_plot")
)

# server portion

server <- function(input, output) {
  output$sea_lice_plot <- renderPlot(
    data %>%
      group_by(year) %>%
      filter(fish_species == input$fish_species) %>%
      ggplot(
        aes(
          x = year, 
          y = lep_total
        )) + 
      geom_col() +
      xlim(2015, 2021) +
      ylim(0, 60) +
      theme_minimal() +
      labs(
        x = "Sampling year",
        y = expression("Total number of Lepeophtheirus salmonis")
      )
  )
}

# App portion

shinyApp(ui = ui, server = server)
