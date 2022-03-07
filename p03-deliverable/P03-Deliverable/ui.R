source("server.R")
library(dplyr)
library(ggplot2)
library(plotly)
library(styler)
library(tidyverse)
library(shiny)

introduction <- tabPanel(
  h4("Introduction")
)

page1 <- tabPanel(
  h4("Page 1")
)

page2 <- tabPanel(
  h4("Page 2")
)

page3 <- tabPanel(
  h4("Interactice Chart 3"),
  fluidPage(
    titlePanel("Duration of Songs Over Years by Genre"),
    sidebarLayout(
      sidebarPanel(
        selectInput("genre",label="Genre:",
                    choices=unique(all_musicx$Genre)),
        hr(),
        sliderInput(
          "size", label="Point Size: ", max=5,min = 1,value = 3)
        
      ),
      mainPanel(
        plotlyOutput("chart"))
      
    ),
    helpText("")
  )
)

ui <- navbarPage(
  tags$title("P03 Final Deliverable"),
  introduction,
  page1,
  page2,
  page3
)
