library(shiny)
ui <- fluidPage(
  numericInput("a", "value:", 10),
  numericInput("b", "value:", 5),
  numericInput("c", "value:", 15),
  numericInput("d", "value:", 20),
  
  textOutput("f"),
  actionButton("button", "click for see result", class="btn-success")
  
)

server1 <- function(input, output, session) {
  observeEvent(input$button, {
    c <- reactive(input$a * input$b)
    d <- reactive(input$c - input$d)
    output$f <- renderText(paste0("output: ",c()-d()))
  })
}


shinyApp(ui, server1)