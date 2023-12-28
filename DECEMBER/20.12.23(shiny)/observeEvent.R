library(shiny)

ui <- fluidPage(
  actionButton("button1", "Click me"),
  textOutput("myText")
)

server <- function(input, output, session) {
  
  myVar <- reactiveVal(NULL)
  
  observeEvent(input$button1, {
    myVar(Sys.time())
  })
  
  output$myText <- renderText({
    
      paste("You clicked the button at", myVar())
    
  })
  
}

shinyApp(ui, server)
