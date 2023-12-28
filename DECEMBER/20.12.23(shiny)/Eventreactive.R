library(shiny)

ui <- fluidPage(
  actionButton("button1", "Click me"),
  textOutput("myText")
)

server <- function(input, output, session) {
  
  myVar <- eventReactive(input$button1, {
    Sys.time()
  })
  
  output$myText <- renderText({
    paste("You clicked the button at", myVar())
  })
  
}

shinyApp(ui, server)
