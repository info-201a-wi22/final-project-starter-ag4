source("server.R")
library(dplyr)
library(ggplot2)
library(plotly)
library(styler)
library(tidyverse)
library(shiny)

introduction <- tabPanel(
  h4("Introduction"),
  p("This project centers around the trends of music and the way that its components has changed over
    the decades. From the data set, we were able to find specific information about each track of music
    and from that we can analyze the patterns of music in each of the decades. The importance of this project
    is that music, like us, are always evolving and trends that were popular last year may have changed by now. We wanted
    to find the things that have changed over the rise of mainstream music, 1940, up to the most recent decade, the 2010s.
    Furthermore, music is something that has the power to bring people together and more than ever has been a source of comfort
    for many people, so we wanted to explore the trends of music and perhaps visualize the direction that music will take in
    the near future.")
)

page1 <- tabPanel(
  h4("Page 1")
)

page2 <- tabPanel(
  h4("Page 2"),
  p("This visualization shows the duration of songs over the years of a selected genre. A single genre must 
    be represented over 5 times to show up as an option on the dropdown menu to avoid a chart with only one or a couple songs.
    Once a genre is selected, every song of that genre is plotted on the graph with the song year on the x axis and song 
    duration (in seconds) on the y axis."),
  fluidPage(
    titlePanel("Duration of Songs Over Years by Genre"),
    sidebarLayout(
      sidebarPanel(
        selectInput("genre",label="Genre:",
                    choices=unique(dropdown_options_jake$top.genre)),
        hr(),
        helpText("This plot shows the trends in song duration over the years given a particular genre. We can see that many of the 
                 genres have no strong increase or decrease in song length throughout the years, and most seem to average around the 
                 250-300 seconds per song range, however, a few genres do have a noticable trend. In the late 1970s, disco songs were around
                 260 seconds, but recently are averaging closer to 200, showing a clear and steady decrease in average song length in recent
                 times. Probably the clearest trend in a single genre is the shortening of songs within the dance pop genre, which started at 
                 about 275 seconds per song in the 1980s, but has shortened to the 210-225 second range in the 2010s. "),
        sliderInput(
          "size", label="Point Size: ", max=5,min = 1,value = 3)
        
      ),
      mainPanel(
        plotlyOutput("chart"))
      
    )
    
  )
  
)

page3 <- tabPanel(
  h4("Page 3"),
  p("The visualization on this page attempts to find trends in different values that were recorded in the
    data set and group them by decade so we can see the variations -- the increase/decrease in the value across
    each of the decade. The values that are selected for the graph are the BPM, the Energy Level and the
    Danceability of the songs summarized by the mean in each decade that was included in the data set."),
  fluidPage(    
    titlePanel("Music Statistics By Decade"),
    sidebarLayout(      
      sidebarPanel(
        selectInput("type", "Type:", 
                    choices=colnames(graph_non)),
        hr(),
        helpText("This graph shows the trends in each value across the decade. From this, we can see
                 that the BPM hasn't really changed over the years, there were differences but they didn't
                 show any trends about where the graph is heading. The Danceability of the songs has increased
                 from decade to decade, and the energy level has also increased decade by decade.")
      ),
      mainPanel(
        plotOutput("dataplot", click = "point_click"),
        verbatimTextOutput("info")
      )
    )
  )
)

page4 <- tabPanel(
  h4("Summary Takeaways")
)

page5 <- tabPanel(
  h4("Report")
)

ui <- navbarPage(
  tags$title("P03 Final Deliverable"),
  introduction,
  page1,
  page2,
  page3,
  page4,
  page5
)
