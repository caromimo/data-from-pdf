remove(list=ls())

library(shiny)
library(ggplot2)
library(magrittr)
library(dplyr)
library(janitor)
library(readr)
library(here)

data <- 
  read_csv(here("data/interim/broughton_archipelago/BA_data_2016_to_2020.csv")) %>%
  clean_names()

all_species <- data %>%
  select(fish_species) %>%
  distinct()

# ui portion

ui <- fluidPage(
  selectInput(
    inputId = "fish_species",
    label = "Select the fish species:",
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
      geom_col(width = 0.5) +
      xlim(2015, 2021) +
      ylim(0, 120) +
       labs(
        x = "Sampling year in the Broughton Archipelago in BC",
        y = expression("Total number of L. salmonis on fish")
      ) +
      theme_minimal() +
      theme(
        axis.title = element_text(size=14), 
        axis.text = element_text(size=12)
        )
  )
}

# App portion

shinyApp(ui = ui, server = server)
