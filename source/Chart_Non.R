library(ggplot2)
read.csv("/Users/non/Desktop/uw/info201/final-project-starter-ag4/archive/2010.csv")

music2010 <- read.csv("/Users/non/Desktop/uw/info201/final-project-starter-ag4/archive/2010.csv")
music2000 <- read.csv("/Users/non/Desktop/uw/info201/final-project-starter-ag4/archive/2000.csv")

graph_non <- ggplot(music2010, aes(x=bpm, y=nrgy)) + geom_density2d() + labs(x = "Beats Per Minute", y = "Energy", title = "Energy vs. BPM")
