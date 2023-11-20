library(shiny)
ui <- fluidPage(
  textInput("var","var","Sepal.Length"),
  verbatimTextOutput("resulttext")
)
df <- iris
server <- function(input, output, session) {
  var <- reactive(df[input$var])
  range <- reactive(range(var(), na.rm = TRUE))
  
  output$resulttext <- renderText({
    req(range())
  })
}

shinyApp(ui, server)

