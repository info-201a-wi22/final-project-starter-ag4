source("server.R")


introduction <- tabPanel(
  h4("Introduction")
)

page1 <- tabPanel(
  h4("Page 1")
)

page2 <- tabPanel(
  h4("Page 2")
)

page3 <- tabPanel(
  h4("Page 3")
)

page4 <- tabPanel(
  h4("Summary Takeaways")
)

page5 <- tabPanel(
  h4("Report")
)

ui <- navbarPage(
  tags$title("P03 Final Deliverable"),
  introduction,
  page1,
  page2,
  page3
)
