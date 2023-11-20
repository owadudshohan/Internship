library(shiny)

ui <- fluidPage(
  fluidRow(
    column(4,
           numericInput("input1", "Input 1:", 1, min = 1, max = 100)  # Example: Numeric Input
    ),
    column(8,
           plotOutput("plot1")  # Example: Plot Output
    )
  ),
  fluidRow(
    column(6,
           selectInput("input2", "Input 2:", choices = c("A", "B", "C"))  # Example: Select Input
    ),
    column(6,
           tableOutput("table1")  # Example: Table Output
    )
  )
)

server <- function(input, output, session) {
  # Example: Reactive calculation based on inputs
  reactive_data <- reactive({
    input_val1 <- input$input1
    input_val2 <- input$input2
    
    # Perform calculations or data manipulation here
    result_data <- data.frame(
      Value1 = rnorm(input_val1),
      Value2 = rnorm(input_val1),
      Category = rep(input_val2, each = input_val1)
    )
    
    # Return the result
    return(result_data)
  })
  
  # Example: Render a plot based on reactive data
  output$plot1 <- renderPlot({
    data <- reactive_data()
    
    # Create a plot using the data
    plot(data$Value1, data$Value2, col = as.factor(data$Category))
  })
  
  # Example: Render a table based on reactive data
  output$table1 <- renderTable({
    data <- reactive_data()
    
    # Create a table using the data
    data
  })
}

shinyApp(ui, server)
