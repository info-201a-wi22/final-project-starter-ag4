library(dplyr)
library(ggplot2)
library(plotly)
library(styler)
library(tidyverse)
library(shiny)

music
#all_music <- all_music %>% 
 # mutate(decade = floor(year/10)*10)


chart_datax <- all_musicx %>%
  select(year,dur,top.genre)%>%
  rename("Genre" = "top.genre")
  #filter(Genre != is.null(TRUE))

server <- function(input, output) {
  output$chartx <- renderPlotly({
    plot_data <- chart_datax %>%
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

