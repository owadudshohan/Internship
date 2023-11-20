library(shiny)
ui<-fluidPage(
tags$p(
  "You made ", 
  tags$b("$", textOutput("amount", inline = TRUE)),
  " in the last ", 
  textOutput("days", inline = TRUE),
  " days " 
)
)
server<-function(input, output, session){
  
}
shinyApp(ui, server)