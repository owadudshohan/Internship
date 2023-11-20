library(shiny)

ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
)

server <- function(input, output, session) {
  output$greeting <- renderText({
    paste0("Hello ", input$name, " !")
  })
}

shinyApp(ui, server)

library(shiny)
ui <- fluidPage(
  textInput("name", "What is your name", "SHOHAN"),
  textOutput("shohan")
)
server <- function(input, output, session){
  output$shohan <- renderText({
    paste0(())
  })
}