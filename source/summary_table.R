library(dplyr)
all_music <- read.csv("all_music.csv") 
summary_table <- all_music %>%
  group_by(decade = all_music$decade) %>%
  summarize(mean_bpm = mean(bpm), median_bpm = median(bpm) ,mean_energy = mean(nrgy),median_energy = median(nrgy), mean_dance = mean(dnce), median_dance = median(dnce), mean_decibels = mean(dB), median_decibels = median(dB), mean_duration = mean(dur), median_duration = median(dur)) %>% 
  round(digit = 2)
