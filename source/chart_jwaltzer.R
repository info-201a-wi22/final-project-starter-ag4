#hello 
library(dplyr)
library(ggplot2) 

music_1950 <- read.csv("/Users/jwaltzer/OneDrive - Eastside Preparatory School/Desktop/UW/Freshie/Winter/INFO 201/1950.csv")
music_1960 <- read.csv("/Users/jwaltzer/OneDrive - Eastside Preparatory School/Desktop/UW/Freshie/Winter/INFO 201/1960.csv")
music_1970 <- read.csv("/Users/jwaltzer/OneDrive - Eastside Preparatory School/Desktop/UW/Freshie/Winter/INFO 201/1970.csv")
music_1980 <- read.csv("/Users/jwaltzer/OneDrive - Eastside Preparatory School/Desktop/UW/Freshie/Winter/INFO 201/1980.csv")
music_1990 <- read.csv("/Users/jwaltzer/OneDrive - Eastside Preparatory School/Desktop/UW/Freshie/Winter/INFO 201/1990.csv")
music_2000 <- read.csv("/Users/jwaltzer/OneDrive - Eastside Preparatory School/Desktop/UW/Freshie/Winter/INFO 201/2000.csv")
music_2010 <- read.csv("/Users/jwaltzer/OneDrive - Eastside Preparatory School/Desktop/UW/Freshie/Winter/INFO 201/2010.csv")
music_1970 <- rename(music_1970, "Number" = "ï..Number")
music_1980 <- rename(music_1980, "Number" = "ï..Number")
music_1990 <- rename(music_1990, "Number" = "ï..Number")
music_2000 <- rename(music_2000, "Number" = "ï..Number")
music_2010 <- rename(music_2010, "Number" = "ï..Number")

all_music <- do.call("rbind", list(music_1950,music_1960,music_1970, music_1980, music_1990, music_2000,music_2010))

x <- all_music %>% 
  mutate(decade = floor(year/10)*10) 
#%>% 
 #group_by(decade) 


ggplot(x) +
  geom_point(mapping = aes(x = year, y = dur)) +
  geom_smooth(mapping = aes(x = year, y = dur))



