library(dplyr)
all_music <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/all_music.csv") 
summary_table <- all_music %>%
  group_by(decade = all_music$decade) %>%
  summarize(bpm = mean(bpm),energy = mean(nrgy),dance = mean(dnce),decibels = mean(dB),duration = mean(dur)) %>% 
  round(digit = 2)

