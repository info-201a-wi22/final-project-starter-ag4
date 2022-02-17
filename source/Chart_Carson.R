library(dplyr)
library(ggplot2) 

filename_1950 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1950.csv"
music_1950 <- read.csv(filename_1950, header = TRUE, stringsAsFactors = FALSE) %>% mutate(decade = 1950)
filename_1960 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1960.csv"
music_1960 <- read.csv(filename_1960, header = TRUE, stringsAsFactors = FALSE) %>% mutate(decade = 1960)
filename_1970 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1970.csv"
music_1970 <- read.csv(filename_1970, header = TRUE, stringsAsFactors = FALSE) %>% mutate(decade = 1970)
filename_1980 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1980.csv"
music_1980 <- read.csv(filename_1980, header = TRUE, stringsAsFactors = FALSE) %>% mutate(decade = 1980)
filename_1990 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1990.csv"
music_1990 <- read.csv(filename_1990, header = TRUE, stringsAsFactors = FALSE) %>% mutate(decade = 1990)
filename_2000 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/2000.csv"
music_2000 <- read.csv(filename_2000, header = TRUE, stringsAsFactors = FALSE) %>% mutate(decade = 2000)
filename_2010 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/2010.csv"
music_2010 <- read.csv(filename_2010, header = TRUE, stringsAsFactors = FALSE) %>% mutate(decade = 2010)

#music_1970 <- rename(music_1970, "Number" = "?..Number")
#music_1980 <- rename(music_1980, "Number" = "?..Number")
#music_1990 <- rename(music_1990, "Number" = "?..Number")
#music_2000 <- rename(music_2000, "Number" = "?..Number")
#music_2010 <- rename(music_2010, "Number" = "?..Number")

all_music <- rbind(music_1950, music_1960, music_1970, music_1980, music_1990, music_2000, music_2010)

plot_carson <- ggplot(all_music, aes(group = decade, x = dB, fill = decade)) +
  geom_boxplot() +
  labs(title = "dB of Music across decades")
