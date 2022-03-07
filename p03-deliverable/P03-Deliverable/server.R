library(dplyr)
library(tidyr)
library(tidyverse)

music_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/all_music.csv")


graph_non <- music_data %>%
  select(decade, nrgy, dnce, bpm) %>%
  group_by(decade) %>%
  summarize("Energy" = mean(nrgy), "Danceability" = mean(dnce), "BPM" = mean(bpm)) %>%
  remove_rownames() %>%
  column_to_rownames(var = "decade")
  

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
}
