source("server.R")

page1 <- tabPanel(
  h4("Page 1")
)

page2 <- tabPanel(
  h4("Page 2")
)

page3 <- tabPanel(
  h4("Page 3")
)

ui <- navbarPage(
  tags$title("P03 Final Deliverable"),
  page1,
  page2,
  page3
)
