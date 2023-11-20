library(shiny)
ui<-fluidPage( 
    textOutput("Sh")
  
)
server <- function(input, output, session){
  output$Sh <- renderText("Hello")
}
shinyApp(ui, server)