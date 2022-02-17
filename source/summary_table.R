library(dplyr)
all_music <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/all_music.csv") 
summary_table <- all_music %>%
  group_by(decade = all_music$decade) %>%
  summarize(mean_bpm = mean(bpm), mean_energy = mean(nrgy), mean_dance = mean(dnce), mean_decibels = mean(dB), mean_duration = mean(dur)) %>% 
  round(digit = 2)

