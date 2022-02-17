#hello 
library(dplyr)
library(ggplot2) 

music_1950 <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1950.csv")
music_1960 <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1960.csv")
music_1970 <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1970.csv")
music_1980 <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1980.csv")
music_1990 <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1990.csv")
music_2000 <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/2000.csv")
music_2010 <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/2010.csv")
#music_1970 <- rename(music_1970, "Number" = "?..Number")
#music_1980 <- rename(music_1980, "Number" = "?..Number")
#music_1990 <- rename(music_1990, "Number" = "?..Number")
#music_2000 <- rename(music_2000, "Number" = "?..Number")
#music_2010 <- rename(music_2010, "Number" = "?..Number")

all_music <- do.call("rbind", list(music_1950,music_1960,music_1970, music_1980, music_1990, music_2000,music_2010))

all_music <- all_music %>% 
  mutate(decade = floor(year/10)*10)

# write.csv(all_music,"https://github.com/info-201a-wi22/final-project-starter-ag4/blob/main/data/all_music.csv", row.names = TRUE)


#%>% 
 #group_by(decade) 


#do a write csv file and put it in data folder 

graph_jacob <- ggplot(all_music) +
  geom_point(mapping = aes(x = year, y = dur)) +
  geom_smooth(mapping = aes(x = year, y = dur)) +
  labs(y="Duration of Song (Seconds)", x="Year", title="Duration of Songs Over Years")



