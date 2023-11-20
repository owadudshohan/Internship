# library(shiny)
# ui <- fluidPage(
#   textInput("name", "What's your name?", "shohan"),
#   textOutput("greeting")
# )
# 
# server <- function(input, output, session) {
#   string <- reactive(paste0("Hello ", input$name, "!"))
#   
#   output$greeting <- renderText(string())
#   observeEvent(input$name, {
#     message("Greeting performed")
#   })
# }
# shinyApp(ui, server)

library(shiny)
ui <- fluidPage(
  textInput("name", "What is your name", "shohan"),
  textOutput("get")
)
server <- function(input, output, session){
  string <- reactive(paste0("Hello!!! ", input$name, "!!!"))
  output$get <- renderText(string())
  observeEvent( input$name, {
    message("")
  })
}
shinyApp(ui, server)