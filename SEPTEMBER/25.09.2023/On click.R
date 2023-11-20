library(shiny)
library(ggplot2)

freqpoly <- function(x1, x2, binwidth = 0.1, xlim = c(-3, 3)) {
  df <- data.frame(
    x = c(x1, x2),
    g = c(rep("x1", length(x1)), rep("x2", length(x2)))
  )
  
  ggplot(df, aes(x, colour = g)) +
    geom_freqpoly(binwidth = binwidth, size = 1) +
    coord_cartesian(xlim = xlim)
}

ui <- fluidPage(
  fluidRow(
    column(3,
           numericInput("lamda1", label = "lamda1", value = 3),
           numericInput("lamda2", label = "lamda2", value = 5),
           numericInput("n", label = "n", value = 1e4, min = 0),
           actionButton("simulate", "Simulate!")
      
    ),
    column(9, plotOutput("hist"))
  )
)

server <- function(input, output, session){
  x1 <- reactive({
    input$simulate
    rpois(input$n, input$lamda1)
  })
  x2 <- reactive({
    input$simulate
    rpois(input$n, input$lamda2)
  })
  output$hist <- renderPlot({
    freqpoly(x1(), x2(), binwidth = 1, xlim = c(0, 40))
  }, res = 96)
}
shinyApp(ui, server)