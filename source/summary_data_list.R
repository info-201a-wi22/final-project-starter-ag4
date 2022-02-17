library(dplyr)
music <- read.csv("all_music.csv")


decade_with_max_dur <- music%>%
  group_by(decade) %>%
  summarize(avg_dur = mean(dur, na.rm = TRUE))%>%
  filter(avg_dur == max(avg_dur)) %>%
  select(decade)

decade_with_max_dB <- music%>%
  group_by(decade) %>%
  summarize(mean_dB = mean(dB, na.rm = TRUE))%>%
  filter(mean_dB == max(mean_dB)) %>%
  select(decade)

decade_with_max_bpm <- music%>%
  group_by(decade) %>%
  summarize(avg_bpm = mean(bpm, na.rm = TRUE))%>%
  filter(avg_bpm == max(avg_bpm)) %>%
  select(decade)

decade_with_max_nrgy <- music%>%
  group_by(decade) %>%
  summarize(avg_nrgy = mean(nrgy, na.rm = TRUE))%>%
  filter(avg_nrgy == max(avg_nrgy)) %>%
  select(decade)


summary_info <- list()

summary_info$num_songs <- nrow(music)
summary_info$decade_with_longest_songs <- decade_with_max_dur[[1]]
summary_info$decade_with_loudest_songs <- decade_with_max_dB[[1]] 
summary_info$decade_with_most_avg_bpm <- decade_with_max_bpm[[1]]
summary_info$decade_with_most_avg_nrgy <- decade_with_max_nrgy[[1]]

summary_info





         