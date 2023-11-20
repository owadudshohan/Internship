# library(shiny)
# ui <- navbarPage(
#   "Page title",
#   tabPanel("panel 1", "This is panel one"),
#   tabPanel("panel 2", "This is panel two"),
#   tabPanel("panel 3", "This is panel three"),
#   navbarMenu("subpanels",
#              tabPanel("panel 4a", "four-a"),
#              tabPanel("panel 4b", "four-b"),
#              tabPanel("panel 4c", "four-c")
#   )
# )
# server<-function(input, output, session){
# 
# }
#shinyApp(ui, server)


library(shiny)
ui<-navbarPage(
  "page title",
  tabPanel("panel 1", "This is panel one"),
  tabPanel("panel 2", "This is panel two"),
  tabPanel("panel 2", "This is panel three"),
  navbarMenu("subpanels",
    tabPanel("panel 4a", "four-a"),
    tabPanel("panel 4b", "four-b"),
    tabPanel("panel 4c", "four-c")
  )
)
server<-function(input, output, session){

}
shinyApp(ui, server)