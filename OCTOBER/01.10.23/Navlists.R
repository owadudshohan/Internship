# library(shiny)
# ui <- fluidPage(
#   navlistPanel(
#     id = "tabset",
#     "Heading 1",
#     tabPanel("panel 1", "Panel one contents"),
#     "Heading 2",
#     tabPanel("panel 2", "Panel two contents"),
#     "Heading 3",
#     tabPanel("panel 3", "Panel three contents")
#   )
# )
# server<-function(input, output ,session){
#   
# }
# shinyApp(ui, server)
library(shiny)
ui<-fluidPage(
  navlistPanel(
    id="tabset",
    "Heading 1",
    tabPanel("panel 1", "Panel one contents"),
    "Heading 2",
    tabPanel("panel 2", "panel two contents"),
    "Heading 3",
    tabPanel("panel 3", "panel three contents")
  )
)
server<-function(input, output, session){
  
}
shinyApp(ui, server)