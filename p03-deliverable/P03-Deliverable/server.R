library(dplyr)
library(ggplot2)
library(plotly)
library(styler)
library(tidyverse)
library(shiny)



music_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/all_music.csv")


graph_non <- music_data %>%
  select(decade, nrgy, dnce, bpm) %>%
  group_by(decade) %>%
  summarize("Energy" = mean(nrgy), "Danceability" = mean(dnce), "BPM" = mean(bpm)) %>%
  remove_rownames() %>%
  column_to_rownames(var = "decade")
  
chart_data_jake <- music_data %>%
  select(year,dur,top.genre)%>%
  rename("Genre" = "top.genre")
#filter(Genre != is.null(TRUE))

server <- function(input, output) {
  output$dataplot <- renderPlot({
    barplot(graph_non[,input$type],
            names = rownames(graph_non),
            main = input$type,
            ylim = c(0, 150),
            col = "#69b3a2",
            ylab = "Value",
            xlab = "Type")
  })
  
  
  output$chart <- renderPlotly({
    plot_data <- chart_data_jake %>%
      filter(Genre==input$genre)%>%
      select(year,dur)
    
    ggplot(plot_data)+
      geom_point(
        mapping = aes_string(x="year",y="dur"),
        size=input$size
      )+
      labs(
        x="Year",
        y="Duration of Song (Seconds)",
        title ="Duration of Songs Over Years by Genre"
      )
  })
}
