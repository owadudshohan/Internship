library(shiny)
ui <- fluidPage(
  numericInput("a", "value:", 10, min = 1, max = 100),
  numericInput("b", "value:", 15, min = 1, max = 100),
  numericInput("d", "value:", 30, min = 1, max = 100),
  verbatimTextOutput("value"),
  textOutput("f"),
  actionButton("button", "click for output", )
  
)

server <- function(input, output, session) {
  c <- reactive(input$a + input$b)
  e <- reactive(c() + input$d)
  output$f <- renderText(paste0("output: ",c()))
}


server1 <- function(input, output, session) {
  observeEvent(input$button, {
    c <- (input$a + input$b)
    e <- (c + input$d)
    output$f <- renderText(paste0("output: ", e))
  })
}


shinyApp(ui, server1)

