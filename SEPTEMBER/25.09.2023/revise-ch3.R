library(shiny)
ui <- fluidPage(
  textInput("name", "Enter your name:"),
  textOutput("greeting")
)

server <- function(input, output, session) {
  greeting <- reactive({
    paste0("Hello ", input$name)
  })
  
  output$greeting <- renderText({
    greeting()
  })
}
shinyApp(ui, server)
