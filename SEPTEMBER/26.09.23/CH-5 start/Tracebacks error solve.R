library(shiny)

h <- function(x) x * 2
g <- function(x) h(x)
f <- function(x) g(x)

ui <- fluidPage(
  selectInput("n", "N", 1:10),
  plotOutput("plot")
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    n <- f(as.numeric(input$n))
    plot(head(cars, n))
  }, res = 96)
}

shinyApp(ui, server)
