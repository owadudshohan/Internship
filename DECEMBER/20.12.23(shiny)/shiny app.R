library(shiny)
ui <- fluidPage(
  actionButton("btn1", label = "Button1", value = 200),
  actionButton("btn2", label = "Button2", value = 500),
  plotOutput("hist")
)
server <- function(input, output) {
  value <- reactiveValues(data = 1) # (data = rnorm(300))
  observeEvent(input$btn1, value$data <- rnorm(300))
  observeEvent(input$btn2, value$data <- runif(500))
  output$hist <- renderPlot(hist(value$data))
}
shinyApp(ui = ui, server = server)