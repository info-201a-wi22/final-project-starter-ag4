library(dplyr)
library(ggplot2) 

filename_1950 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1950.csv"
music_1950 <- read.csv(filename_1950, header = TRUE, stringsAsFactors = FALSE)
filename_1960 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1960.csv"
music_1960 <- read.csv(filename_1960, header = TRUE, stringsAsFactors = FALSE)
filename_1970 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1970.csv"
music_1970 <- read.csv(filename_1970, header = TRUE, stringsAsFactors = FALSE)
filename_1980 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1980.csv"
music_1980 <- read.csv(filename_1980, header = TRUE, stringsAsFactors = FALSE)
filename_1990 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/1990.csv"
music_1990 <- read.csv(filename_1990, header = TRUE, stringsAsFactors = FALSE)
filename_2000 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/2000.csv"
music_2000 <- read.csv(filename_2000, header = TRUE, stringsAsFactors = FALSE)
filename_2010 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/2010.csv"
music_2010 <- read.csv(filename_2010, header = TRUE, stringsAsFactors = FALSE)