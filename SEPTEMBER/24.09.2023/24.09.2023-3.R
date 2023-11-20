library(shiny)
ui <- fluidPage(
  numericInput("a", "value:", 5, min = 1, max = 100),
  numericInput("b", "value:", 15, min = 1, max = 100),
  numericInput("c", "value:", 5, min = 1, max = 100),
  numericInput("d", "value:", 10, min = 1, max = 100),
 
  
  textOutput("f")
  
)

server <- function(input, output, session) {
  
  a <- reactive(input$a * 10)
  b <- reactive(a() + input$b)
  c <- reactive(b() / input$c) 
  d <- reactive(c() ^ input$d)
 
  output$f <- renderText(c())
}
shinyApp(ui, server)