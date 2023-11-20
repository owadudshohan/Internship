library(shiny)
ui <- fluidPage(
  numericInput("x1", "value:", 10, min = 1, max = 100),
  numericInput("x2", "value:", 15, min = 1, max = 100),
  numericInput("x3", "value:", 20, min = 1, max = 100),
  numericInput("y1", "value:", 30, min = 1, max = 100),
  numericInput("y2", "value:", 5, min = 1, max = 100),
  verbatimTextOutput("value"),
  textOutput("z")
  
)
server <- function(input, output, session) {
  x <- reactive(input$x1 + input$x2 + input$x3)
  y <- reactive(input$y1 + input$y2)
  
  output$value <- renderText({
   
    x() / y()
  })
  
}


shinyApp(ui, server)

