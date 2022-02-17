library(ggplot2)

music2010 <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-ag4/main/data/2010.csv")

graph_non <- ggplot(music2010, aes(x=bpm, y=nrgy)) + geom_density2d() + labs(x = "Beats Per Minute", y = "Energy", title = "Energy vs. BPM")
