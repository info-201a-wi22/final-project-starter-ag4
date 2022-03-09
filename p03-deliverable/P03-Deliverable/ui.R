source("server.R")
library(dplyr)
library(ggplot2)
library(plotly)
library(styler)
library(tidyverse)
library(shiny)
library(shinythemes)

introduction <- tabPanel(
  h4("Introduction"),
  h2("Introduction"),
  p("This project centers around the trends of music and the way that its components has changed over
    the decades. From the data set, we were able to find specific information about each track of music
    and from that we can analyze the patterns of music in each of the decades. The importance of this project
    is that music, like us, are always evolving and trends that were popular last year may have changed by now. We wanted
    to find the things that have changed over the rise of mainstream music, 1940, up to the most recent decade, the 2010s.
    Furthermore, music is something that has the power to bring people together and more than ever has been a source of comfort
    for many people, so we wanted to explore the trends of music and perhaps visualize the direction that music will take in
    the near future.")
)



page1 <- tabPanel(
  h4("Page 1"),
  fluidPage(
    titlePanel("Volume of Popular Music across Decades"),
    sidebarLayout(
      sidebarPanel(
        checkboxGroupInput(inputId = 'decades',
                           label = 'Decade Selection',
                           choices = unique(carson$decade),
                           selected = unique(carson$decade))
      ),
      mainPanel(
        plotlyOutput("plot"))
      
    )
  )
)

page2 <- tabPanel(
  h4("Page 2"),
  p("This visualization shows the duration of songs over the years of a selected genre. A single genre must 
    be represented over 5 times to show up as an option on the dropdown menu to avoid a chart with only one or a couple songs.
    Once a genre is selected, every song of that genre is plotted on the graph with the song year on the x axis and song 
    duration (in seconds) on the y axis."),
  fluidPage(
    titlePanel("Duration of Songs Over Years by Genre"),
    sidebarLayout(
      sidebarPanel(
        selectInput("genre",label="Genre:",
                    choices=unique(dropdown_options_jake$top.genre)),
        hr(),
        helpText("This plot shows the trends in song duration over the years given a particular genre. We can see that many of the 
                 genres have no strong increase or decrease in song length throughout the years, and most seem to average around the 
                 250-300 seconds per song range, however, a few genres do have a noticable trend. In the late 1970s, disco songs were around
                 260 seconds, but recently are averaging closer to 200, showing a clear and steady decrease in average song length in recent
                 times. Probably the clearest trend in a single genre is the shortening of songs within the dance pop genre, which started at 
                 about 275 seconds per song in the 1980s, but has shortened to the 210-225 second range in the 2010s. "),
        sliderInput(
          "size", label="Point Size: ", max=5,min = 1,value = 3)
        
      ),
      mainPanel(
        plotlyOutput("chart"))
      
    )
    
  )
  
)

page3 <- tabPanel(
  h4("Page 3"),
  p("The visualization on this page attempts to find trends in different values that were recorded in the
    data set and group them by decade so we can see the variations -- the increase/decrease in the value across
    each of the decade. The values that are selected for the graph are the BPM, the Energy Level and the
    Danceability of the songs summarized by the mean in each decade that was included in the data set."),
  fluidPage(    
    titlePanel("Music Statistics By Decade"),
    sidebarLayout(      
      sidebarPanel(
        selectInput("type", "Type:", 
                    choices=colnames(graph_non)),
        hr(),
        helpText("This graph shows the trends in each value across the decade. From this, we can see
                 that the BPM hasn't really changed over the years, there were differences but they didn't
                 show any trends about where the graph is heading. The Danceability of the songs has increased
                 from decade to decade, and the energy level has also increased decade by decade.")
      ),
      mainPanel(
        plotOutput("dataplot", click = "point_click"),
        verbatimTextOutput("info")
      )
    )
  )
)

page4 <- tabPanel(
  h4("Summary Takeaways"),
  h3("Summary Takeaways"),
  p("Over time, the medium through which people listen to music has greatly changed. In the 50s and 60s, tuning 
  into the radio was the most popular, in the 70s and 80s cassettes were the most used, in the 90s CDs emerged
  and were quite popular, by the 2000s mp3 players became very popular, and throughout the 2010s to today- 
  streaming is by far the most prominent. The general trend here is that storing music has become less data-intensive
  as newer formats have more space for songs. This is what we believe is a great influence as to why the duration of
  songs has greatly increased since the 50s. Also, with mediums such as the radio- it is not possible to skip a
  song so a station would be safer to play short songs to keep audiences tuned in to prevent them from leaving 
  due to boredom caused by a long song they could potentially dislike. However, duration has steadily decreased
  since the 80s, we believe this is because the attention span of listeners has decreased as the ease of access to 
  millions of songs has emerged. Also, the large change in the music industry due to digital music has changed the 
  way artists structure songs, potentially playing a part in this decrease of duration."),
  p("Since the 50s, millions of people have lived different lives, and through this different have trends appeared. 
    We believe this is the reason for many of the trends in music we saw through the data. For example, the energy
    increase is likely due to genres in the 40s and 50s being more calm and slow such as blues, jazz, country, and
    folk and as time progressed, genres such as disco, heavy metal, rap, and EDM all emerged- which are seen as high
    volume, with a large variety of sounds. We also believe the change in danceability is likely due to trends in 
    popularity."),
  p("Volume has also increased greatly over time. As music technology has progressed, there is more access to unique 
    sounds and many ways to manipulate these sounds. This has led to songs having fewer quiet spots. Also, genres
    that have emerged in the past 30 years such as EDM, hip hop, grunge, and rap tend to be louder than older genres
    such as folk and R&B. An interesting reason why volume increased from the late 90s to the early 2000s is the idea
    of a volume war where artists wanted to outdo each other when attempting to make catchy, unique music. Bands such
    as Metallica would make their songs louder and louder to catch the listener's attention.")
)

page5 <- tabPanel(
  h4("Report"),
  h2("Music Data Over The Years by Non Pronanun, Jacob Waltzer, Carson Klein, Cole Graham --
    University of Washington, March 7, 2022"),
  p(" "),
  h3("Keywords: "),
  p("Music genre, Popularity, Societal changes, Barriers to entry"),
  h3("Abstract: "),
  p("Our main question is how do societal changes influence the popularity of music 
    genres which is important because music is a very large industry and is influential in many 
    people's lives. To address this question we will evaluate the most popular songs since the 1950s 
    and their attributes (i.e. beats per minute, year, genre, etc.), Spotify premium subscribers per 
    quarter since 2015, and number of music sales depending on medium. Our main concern is that there 
    is not enough extensive and reliable data; To address this concern we will find as much data as 
    possible and compare to ensure accuracy. Considering that music is more accessible than ever, this 
    is important because music is integral to lives of people. Accordingly, we plan to observe trends 
    in data pertaining to popularity of music genres."),
  h3("Introduction: "),
  p("An area of interest that we shared and chose to analyze is music. Today, music is 
    something that is universal, almost everyone listens to music in their leisure time. People's source 
    of music has also evolved over the years and when we think of music nowadays, we don't think of cassette
    tapes and turntables anymore, rather we lean towards music digitalization and streaming platforms such as
    Spotify or Apple Music. In recent years, these platforms grew rapidly with almost 400 million monthly listeners
    from Spotify alone. Therefore, we wanted to find out the growth patterns of these platforms and analyze their 
    development over the years."),
  h4("Design Situation: "),
  p("The third design situation that we considered is the songs that were most popular in each decade
    from 1950 to 2019. This dataset is made by Spotify and it shows specific details of each song that we can gain more 
    insight into the direction of which song is popular in the given timeframe. For this dataset, the human values of this 
    dataset deals most with which songs that the general populous determines as more popular throughout the recent few decades. 
    The direct stakeholders here are the people that listen to music since the 1950, since these data provides a representation 
    of the direction that music popularity is going. The indirect stakeholders for this can be the people who are distributing 
    music, as they might not know the trends of popularity of music, but are responsible for giving people access to music."),
  h3("Research Questions: "),
  p("How do societal changes influence the popularity of specific music genres? 
    How do changing barriers to entry influence the popularity of specific music genres?"),
  h3("The Dataset: "),
  p("The dataset that we used was made up of 7 files in total, each file had roughly 100 rows of the top songs
    from each decade from 1950 to 2010, there were roughly 15 columns for each value. The detail/complexity of the data set is
    pretty in-depth, there are values and attributes such as the BPM, energy, level, genre, and length of the songs. The data set
    comes from Spotify. They make the statistics for what songs are listened to most in each of the decade."),
  h3("Findings: "),
  p("The goal of this was to find specific information and trends in music throughout the decades where music has been
    commercialized and popularized. The data set that we chose to work with had a pretty good level of complexity and detail to it
    so we were able to wrangle out a lot of data, but we decided that we would include the trends of the graph that we created using
    the data and the variables that we found to be most interesting and surprising. The things that we learned from this dataset is that 
    as the decades go by, there is an increase in the volume level of the songs, dB, which meant that people were listening to music 
    louder in recent times than the people in older times did. Then, we found patterns that the energy level and danceability of the 
    songs increased steadily over the course of the data set. Finally, the third visualization showed us that the duration of songs 
    peaked in the 1980s and it decreased aferwards, and that earlier songs in the dataset tended to have significantly smaller 
    duration than the later ones did. The average length of songs throughout the data set was 254 seconds, and the 2000's had songs 
    with the higest volume levels and also the highest energy levels, The fastest songs were from the 1940s, with an average BPM of 127."),
  h3("Discussion: "),
  p("The main reason that we chose this topic to work with was because we all share the same interest in music and find that 
    music in today's world is an important part in everyday life for most people. Ever since the COVID19 pandemic hit, music has become a
    source of happiness and relief that most people choose to dive into. Music can offer a sense of escapism and empathy through the lyrics
    and also the melodies of the songs. For these reasons we decided to choose music as the central idea that we would base our project around.
    The data set that we used had information on music throughout many different decades, which allowed us to have insight into what was popular
    at each given decade in the data set. In addition, we are able to find specific data points that were explained in the Findings section of
    the report. The implications that music has on people's lives today are greater than ever, to reiterate, it has almost become as important as
    conversations that we have throughout the day. Therefore, it was important for us because if something holds this much power over people's daily
    lives than it should be considered and studied extensively to find the underlying patterns and the different aspects of it as much as we can with
    the given data that we have access to."),
  h3("Conclusion: "),
  p("The data that we found shows some correlation between different decades. The one we found to be most interesting is the fact
    that music tends to be louder in the later decades which could mean that it was an attempt to make music more immersive and effective than previous
    decades. Although the correlation in our data doesn't necessary mean causation and that the patterns that arise may not be caused by the trends of
    time, it is certainly worth noting the increase/decrease in different values of the graphs. All in all, it was fun to work with this data set, and we
    hope that the data that we found from this can provide you with more context and insights into the direction that music may be heading towards in the 
    near future.")
)

ui <- navbarPage(
  theme = shinytheme("sandstone"),
  tags$title("P03 Final Deliverable"),
  introduction,
  page1,
  page2,
  page3,
  page4,
  page5
)
