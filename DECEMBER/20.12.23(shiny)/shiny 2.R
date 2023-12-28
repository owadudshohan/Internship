library(shiny)

ui <- fluidPage(
  actionButton("btn1", label = "Button1", value = 2),
  actionButton("btn2", label = "Button2", value = 500),
  plotOutput("hist")
)

server <- function(input, output) {
  value <- reactiveValues(data = NULL, clicks_btn1 = 0, clicks_btn2 = 0)
  
  observeEvent(input$btn1, {
    value$data <- rnorm(300)
    value$clicks_btn1 <- value$clicks_btn1 + 1
  })
  
  observeEvent(input$btn2, {
    value$data <- runif(500)
    value$clicks_btn2 <- value$clicks_btn2 + 1
  })
  
  output$hist <- renderPlot({
    if (!is.null(value$data) && is.numeric(value$data)) {
      hist(value$data, main = paste("Button1 clicks:", value$clicks_btn1, " | Button2 clicks:", value$clicks_btn2))
    } else {
      # Handle the case when data is not numeric
      plot(NULL, xlim = c(0, 1), ylim = c(0, 1), main = "Invalid data type")
    }
  })
}


shinyApp(ui = ui, server = server)
